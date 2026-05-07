FROM alpine AS builder

ARG TARGETARCH
ARG TFLINT_VERSION

RUN apk add --no-cache unzip wget

WORKDIR /tmp
RUN wget -O tflint.zip "https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_${TARGETARCH}.zip" \
    && unzip tflint.zip


FROM alpine

COPY --from=builder /tmp/tflint /usr/local/bin

WORKDIR /builds
CMD ["tflint"]
