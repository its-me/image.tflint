# tflint container images

Automatically built and published container images for [tflint](https://github.com/terraform-linters/tflint), the pluggable Terraform linter.

Available on:
- **Docker Hub**: `1tsme/tflint`
- **Quay.io**: `quay.io/itsme/tflint`
- **GHCR**: `ghcr.io/its-me/tflint`

## Why not use the official image?

The [official Dockerfile](https://github.com/terraform-linters/tflint/blob/master/Dockerfile) uses `ENTRYPOINT ["tflint"]`, which means tflint is always the process that runs — you cannot override it with a shell or any other command at runtime.

This image uses `CMD ["tflint"]` instead. The command can be replaced entirely when running the container, which makes it easier to inspect the environment, debug plugin issues, or use the image as a base:

```sh
# run tflint normally
docker run --rm -v "$(pwd):/builds" 1tsme/tflint

# drop into a shell instead
docker run --rm -it 1tsme/tflint sh
```

## Usage

```sh
docker run --rm -v "$(pwd):/builds" 1tsme/tflint --version
```

Tags follow the upstream release version numbers (e.g. `0.62.0`) plus `latest`.

## Automatic updates

A scheduled workflow checks for new tflint releases daily and publishes updated images to all three registries automatically.
