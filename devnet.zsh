blog() {
    docker logs -f "$(docker ps | grep cl-"$1"-prysm-geth | awk '{print $NF}')" 2>&1 | colo --json
}

vlog() {
    docker logs -f "$(docker ps | grep vc-"$1"-geth-prysm | awk '{print $NF}')" 2>&1 | colo --json
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
        kurtosis run github.com/ethpandaops/ethereum-package --args-file="$HOME/.zsh/kurtosis/$1.yaml" &&
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
