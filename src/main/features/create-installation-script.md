# Create Installation Script

## Requirements
### Implementation
1. Create an executable zsh installation script named /src/main/zsh/install-dev-env.zsh that implements the steps listed in the README.md file's Installation section. Use the apt-get cli command instead of apt as the latter does not have a stable cli interface.
2. Update bash code fenced statements to run under zsh when there is a difference in syntax
3. Do not include any testing code or instructions as echo statements in the src/main/zsh/install-dev-env.zsh script.
### Testing
#### Verify the install-dev-env.zsh script works 
1. Create an executable zsh script src/test/verify-with-test-container.zsh that creates a docker container using the latest GA debian version that executes the src/test/zsh/verify-dev-env-install.zsh script and emits if the script was successful or not and then destroys the container.
2. Update the verify-with-test-container script to use the Dockerfile in the src/test/zsh directory
3. Ensure the container does not exit until the installation and verification scripts are complete. Update the Dockerfile's entry point command if that helps with the solution.
4. Evaluate test results and update until you cannot find a solution without hallucinating. 

## Constraints
1. Only create the script and the test container. Do not create anything else in the project.
2. Consult the README.md for the packages to check for
3. Do not consult any other file in the src/main/features directory.
4. Follow the instructions in the $HOME/.junie/guidelines.md file too.
5. Do not change which package manager installs a tool. All tools defined with an ansible playbook must be installed using ansible. Do not move a package's installation to the first set of apt-get commands in the src/main/zsh/install-dev-env.zsh script.

