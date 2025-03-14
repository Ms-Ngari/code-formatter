# Code Formatter
A GitHub action to automatically format code using Prettier (JavaScript, TypeScript, JSON, CSS, SCSS, Markdown); Black (Python) and Clang-Format (C, C++, Objective-C). This action runs on a push or pull-request event on the main branch

## Usage

### Turn on Github Pages
1. Go to your repository on GitHub.
2. Click on the **Settings** tab.
3. Scroll down to the **Pages** section.
4. Under Source, select **Deploy from a branch**.
5. Under Branch, select **main**.
6. Click Save.

### Using the Action
To use this action, make a file `.github/workflows/auto-format.yml`.  Here's a
template to get started:

```yaml
name: auto-format-code

on:
  push:
    branches:
      - main
  pull_request:

jobs:
  format-code:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          fetch-depth: 0

      - name: Format Generator
        uses: ms-ngari/code-formatter@main
```
