blog() {
    docker logs -f "$(docker ps | grep cl-"$1"-prysm-geth | awk '{print $NF}')" 2>&1 | colo --json
}

vlog() {
    docker logs -f "$(docker ps | grep vc-"$1"-geth-prysm | awk '{print $NF}')" 2>&1 | colo --json
}

dora() {
    open http://localhost:$(docker ps --format '{{.Ports}} {{.Names}}' | awk '/dora/ {split($1, a, "->"); split(a[1], b, ":"); print b[2]}')
}

graf() {
    open http://localhost:$(docker ps --format '{{.Ports}} {{.Names}}' | awk '/grafana/ {split($1, a, "->"); split(a[1], b, ":"); print b[2]}')
}

devnet() {
    kurtosis clean -a &&
        docker buildx build --file ~/.zsh/containers/prysm/Dockerfile . -t prysm-bn-custom-image &&
        docker tag prysm-bn-custom-image prysm-vc-custom-image &&
        kurtosis run github.com/ethpandaops/ethereum-package --args-file="$HOME/.zsh/kurtosis/$1.yaml" &&
        dora
}

stop() {
    kurtosis clean -a
}
