# Path to the binary directory
BIN_DIR := bin

# mdBook settings
MDBOOK_VERSION := 0.4.40
MDBOOK_BIN_URL := https://github.com/rust-lang/mdBook/releases/download/v$(MDBOOK_VERSION)/mdbook-v$(MDBOOK_VERSION)-x86_64-unknown-linux-gnu.tar.gz

# Target for building the mdBook project
build: $(BIN_DIR)/mdbook
	@$(BIN_DIR)/mdbook build

# Target for running the mdBook server
run: $(BIN_DIR)/mdbook
	@$(BIN_DIR)/mdbook serve

# Target for cleaning up the project
clean:
	@rm -rf $(BIN_DIR)

# Rule to download and unpack mdBook if it does not exist
$(BIN_DIR)/mdbook:
	@mkdir -p $(BIN_DIR)
	@curl -sSL $(MDBOOK_BIN_URL) | tar -xz -C $(BIN_DIR)

.PHONY: run build clean
