edit:
	@$$EDITOR .
	@git add .

deploy:
	@sudo true && \
	NIXOS_OLD_GENERATION=$$(readlink -f /run/current-system) && \
	sudo nixos-rebuild switch --flake . --verbose --log-format internal-json |& nom --json && \
	NIXOS_NEW_GENERATION=$$(readlink -f /run/current-system) && \
	nvd diff $$NIXOS_OLD_GENERATION $$NIXOS_NEW_GENERATION

debug:
	@sudo true && \
	NIXOS_OLD_GENERATION=$$(readlink -f /run/current-system) && \
	@sudo nixos-rebuild switch --flake . --show-trace --verbose --option eval-cache false --log-format internal-json |& nom --json && \
	NIXOS_NEW_GENERATION=$$(readlink -f /run/current-system) && \
	nvd diff $$NIXOS_OLD_GENERATION $$NIXOS_NEW_GENERATION

collect:
	@sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d
	@sudo nix store gc --debug

history:
	@nix profile history --profile /nix/var/nix/profiles/system

update:
	@nix flake update
