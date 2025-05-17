blog() {
    docker logs -f "$(docker ps | grep cl-"$1" | awk '{print $NF}')" 2>&1 | colo --json
}

vlog() {
    docker logs -f "$(docker ps | grep vc-"$1" | awk '{print $NF}')" 2>&1 | colo --json
}

vlogs() {
    FILTER=$1      # optional filter string (e.g., "error")
    PATTERN='^vc-' # container name pattern

    CONTAINERS=$(docker ps --format '{{.Names}}' | grep "$PATTERN")

    if [ -z "$CONTAINERS" ]; then
        echo "No vc-* containers found."
        exit 1
    fi

    args=()
    for name in $CONTAINERS; do
        if [ -n "$FILTER" ]; then
            args+=("-l" "bash -c 'docker logs -f $name 2>&1 | grep --line-buffered \"$FILTER\" | sed \"s/^/[$name] /\"'")
        else
            args+=("-l" "bash -c 'docker logs -f $name 2>&1 | sed \"s/^/[$name] /\"'")
        fi
    done

    multitail "${args[@]}"
}

dora() {
    open http://localhost:$(docker ps --format '{{.Ports}} {{.Names}}' | awk '/dora/ {split($1, a, "->"); split(a[1], b, ":"); print b[2]}')
}

graf() {
    open http://localhost:$(docker ps --format '{{.Ports}} {{.Names}}' | awk '/grafana/ {split($1, a, "->"); split(a[1], b, ":"); print b[2]}')
}

devnet() {
    kurtosis clean -a &&
        build_prysm_bn &&
        build_prysm_vc &&
        build_geth &&
        kurtosis run $HOME/src/ethereum-package --image-download=always --args-file="$HOME/.zsh/kurtosis/$1.yaml" &&
        dora
}

stop() {
    kurtosis clean -a
}

build_prysm_bn() {
    local REPO=${1:-~/src/prysm}
    (cd "$REPO" && docker build --file ~/.zsh/containers/prysm/Dockerfile.bn . -t prysm-bn:peerdas)
}

build_prysm_vc() {
    local REPO=${1:-~/src/prysm}
    (cd "$REPO" && docker build --file ~/.zsh/containers/prysm/Dockerfile.vc . -t prysm-vc:peerdas)
}

build_geth() {
    local REPO=${1:-~/src/go-ethereum}
    (cd "$REPO" && docker build --file ~/.zsh/containers/geth/Dockerfile . -t geth:peerdas)
}

# Dump logs for all running cl-*, vc-*, el-* containers
grablogs() {
    # -------- arguments & setup ---------------------------------------------
    local out_dir="${1:-./container-logs}" # first arg = target folder
    shift || true                          # pass the rest straight to docker logs
    local extra_args=("$@")

    # If the directory exists, empty it safely; otherwise create it
    if [[ -d "$out_dir" ]]; then
        echo "Directory already exists: $out_dir"
        # prevent accidents: refuse to touch "" or "/"
        [[ "$out_dir" == "" || "$out_dir" == "/" ]] && {
            echo "❌  Refusing to empty an unsafe path: $out_dir" >&2
            return 1
        }
        echo "Emptying existing directory: $out_dir"
        rm -rf "$out_dir"
    fi
    mkdir -p "$out_dir" || {
        echo "❌  Could not create output directory: $out_dir" >&2
        return 1
    }
    # -------- collect container names ---------------------------------------
    local containers
    containers=$(docker ps --format '{{.Names}}' | grep -E '^(cl|vc|el)-') || true
    if [[ -z "$containers" ]]; then
        echo "No cl-, vc-, or el- containers are running."
        return 0
    fi
    # -------- iterate safely, one line at a time ----------------------------
    echo "Writing logs to: $out_dir"
    while IFS= read -r c; do
        [[ -z "$c" ]] && continue
        local file="${out_dir}/${c}.log"
        echo "  → $c → $file"
        docker logs "${extra_args[@]}" "$c" &>"$file"
    done <<<"$containers"
    echo "✅  $(printf '%s\n' "$containers" | wc -l | tr -d ' ') log file(s) written."
}
