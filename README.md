## NixOS Configurations

### Structure

```plain
.
├── home
│   ├── configurations
│   │   ├── default.nix
│   │   └── ...
│   ├── scripts
│   │   ├── executables
│   │   │   └── ...
│   │   ├── utilities
│   │   │   └── ...
│   │   └── default.nix
│   └── default.nix
├── modules
│   └── ...
├── system
│   └── ...
├── flake.lock
├── flake.nix
└── README.md
```

A brief explanation of the structure of this repository is presented below:

- `./flake.nix`: root of the whole flake, containing some fundamental information
- `./home`: all essential files and configurations in $HOME
  - `./home/configurations`: configurations of all software and some related files grouped by directories
	- `./home/scripts`: some scripts less related to a specific program (mainly used by `zsh`)
	  - `./home/scripts/executables`: scripts that are directly executed by users or other programs
		- `./home/scripts/utilities`: scripts that provide some useful functions or variables
- `./modules`: common modules for building a NixOS system
- `./system`: specific configurations for each particular computer
