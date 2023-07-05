FROM rust:1.70.0

# Switch working directory to `app`
# The `app` directory will be created by Docker if doesn't exist
WORKDIR /app

# Install the required system dependencies for linking configuration
RUN apt update && apt install lld clang -y

# Copy all files from wokring environment to Docker image
COPY . .

# Build binary
RUN cargo build --release
# When `docker run` is executed, launch the binary
ENTRYPOINT ["./target/release/zero2prod"]
