#!/usr/bin/env zsh

# Test script to verify that all required tools are installed and accessible
# This script checks for the presence of each tool mentioned in the README.md

echo "Testing Debian Java Development Environment installation..."
echo "Checking for installed tools:"

# Function to check if a command exists
check_command() {
  local cmd=$1
  local name=$2
  echo -n "Checking for $name... "
  if command -v $cmd &> /dev/null; then
    echo "✅ Found: $($cmd --version 2>&1 | head -n 1)"
    return 0
  else
    echo "❌ Not found"
    return 1
  fi
}

# Function to check if a directory exists
check_directory() {
  local dir=$1
  local name=$2
  echo -n "Checking for $name... "
  if [[ -d $dir ]]; then
    echo "✅ Found"
    return 0
  else
    echo "❌ Not found"
    return 1
  fi
}

# Initialize counters
total=0
passed=0

# Check for Git
((total++))
check_command "git" "Git" && ((passed++))

# Check for GnuPG
((total++))
check_command "gpg" "GnuPG" && ((passed++))

# Check for Oh My Zsh
((total++))
check_directory "$HOME/.oh-my-zsh" "Oh My Zsh" && ((passed++))

# Check for Homebrew
((total++))
check_command "brew" "Homebrew" && ((passed++))

# Check for Node.js
((total++))
check_command "node" "Node.js" && ((passed++))

# Check for Python
((total++))
check_command "python" "Python" && ((passed++))

# Check for Ruby
((total++))
check_command "ruby" "Ruby" && ((passed++))

# Check for Rust
((total++))
check_command "rustc" "Rust" && ((passed++))

# Check for OpenJDK
((total++))
check_command "java" "OpenJDK" && ((passed++))

# Check for Maven
((total++))
check_command "mvn" "Maven" && ((passed++))

# Check for GitHub CLI
((total++))
check_command "gh" "GitHub CLI" && ((passed++))

# Check for pass
((total++))
check_command "pass" "pass" && ((passed++))

# Check for X11 (checking for xorg packages)
((total++))
echo -n "Checking for X11... "
if dpkg -l | grep -q xorg; then
  echo "✅ Found"
  ((passed++))
else
  echo "❌ Not found"
fi

# Print summary
echo "\nTest Summary: $passed/$total tools installed correctly"

if [[ $passed -eq $total ]]; then
  echo "✅ All tools are installed correctly!"
  exit 0
else
  echo "❌ Some tools are missing. Please check the installation."
  exit 1
fi