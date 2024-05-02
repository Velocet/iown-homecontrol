<div align="center" width="100%">

# Contributing to iown-homecontrol

</div>

> [!NOTE]
> You can also ask over at ([Telegram](https://t.me/iownHomecontrol)/[Discord](https://discord.gg/MPEb7dTNdN)) or open a [Discussion](https://github.com/Velocet/iown-homecontrol/discussions) if you have further questions.
>
> Every Contribution is Welcome! ... even if it doesn't follow the rules described here! ;)
>

This document handles the following topics:

- [Project Structure](#project-structure)
  - [Documentation](#documentation)
- [Contributing](#contributing)
  - [Filling Issues](#filing-issues)
  - [Making Changes](#making-changes)
  - [Open a Pull Request](#open-a-pull-request)
- [Guidelines](#guidelines)
  - [Basic](#basics)
    - [Revision Control Hygiene](#revision-control-hygiene)
  - [Visual Studio Code](#visual-studio-code)
    - [Tasks](#tasks)
  - [Settings and Linter](#settings-and-linter)
  - [Coding](#c)
    - [CMake](#cmake)
  - [Python](#python)

<div align="center" width="100%">

## Project Structure

</div>

``` ascii
├───.cache         - Hidden: Build Cache
├───.github        - GitHub Configs
├───.pio           - Hidden: PlatformIO Cache
├───.private       - Hidden: Private Data
├───.trunk         - Hidden: Trunk Cache
├───.vscode        - VSCode Workspace Settings
├───docs           - Documentation Root
│   ├───assets     - Documentation: Support Files (eg.: pictures, stylesheets, etc.)
│   ├───datasheets - Documentation: Relevant Datasheets
│   ├───devices    - Documentation: OEM Devices
│   ├───firmware   - Documentation: Docs + Files
│   ├───parameter  - Decompiled (LuaJIT) io-homecontrol daemon
│   └───reference  - Reference Products/Values: Info in the folder READMEs
│       ├───Si446x - Si446x RE (used in the Cozytouch and other)
│       └───Skitter- Decompiled Somfy Skitter Source (ActionScript) + Firmware
├───extras         - Data to be included in the firmware
├───include        - Project Header Files
├───lib            - Project Specific Private Libraries (eg. LoRa32)
├───scripts        - Extra Script files either for the project or the lib
│   ├───ci         - CI Scripts
│   ├───GNURadio   - GNURadio Scripts
│   ├───IDAPro     - IDA Pro and Ghidra Firmware Helper
│   ├───LuaJIT     - io-homecontrol daemon LuaJIT decompiler
│   ├───renode     - Renode Emulation for the io-homecontrol firmware
│   ├───rtl_433    - Latest rtl_433 binary and configuration
│   └───SVD        - Custom built SVD (STM32F103) use with the ioHome firmware
└───src            - Library Source Code
    └───protocols  - RadioLib Protocol Implementation
```

### Documentation

- Use Markdownlint if possible.
- Use GitHub/MkDocs features like Mermaid.

<div align="center" width="100%">

## Contributing

</div>

### Filing Issues

If you spot a problem, [search if an issue already exists](https://docs.github.com/en/github/searching-for-information-on-github/searching-on-github/searching-issues-and-pull-requests#search-by-the-title-body-or-comments).
If a related issue doesn't exist, you can open a new issue using a relevant [issue form](https://github.com/velocet/iown-homecontrol/issues/new/choose).

- **HowTo**: Solve an Issue
  - Scan through the [existing issues](https://github.com/velocet/iown-homecontrol/issues) to find one that interests you.
    - You can narrow down the search using `labels` as filters.
  - If you find an issue to work on, you are welcome to open a PR with a fix.

### Making Changes

- In the UI: Click **Make a contribution** at the bottom of any page to make small changes such as a typo, sentence fix, or a broken link. This takes you to the `.md` file where you can make your changes and [create a pull request](#pull-request) for a review.
- In a Codespace: For information about using a Codespace, see "[Working in a Codespace](https://github.com/github/docs/blob/main/contributing/codespace.md)."
- Locally
  - [Fork the Repository](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo#fork-an-example-repository)
    - Using GitHub Desktop: [Getting started with GitHub Desktop](https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/getting-started-with-github-desktop) to [fork the repo](https://docs.github.com/en/desktop/contributing-and-collaborating-using-github-desktop/cloning-and-forking-repositories-from-github-desktop).
    - Using the Command Line: I think you don't need any further help...
  - Create a working branch and start with your changes!
  - Commit the changes once you are happy with them.

### Open a Pull Request

- When finished with the changes, create a PR. Don't forget to [link your PR to an issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue) if you are solving one.
- Enable the checkbox to [allow maintainer edits](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/allowing-changes-to-a-pull-request-branch-created-from-a-fork) so the branch can be updated for a merge.
- Once you submit your PR it will be reviewed and maybe you get asked questions, request additional information or get asked for changes to be made before a PR can be merged, either using [suggested changes](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/incorporating-feedback-in-your-pull-request) or pull request comments. You can apply suggested changes directly through the UI. You can make any other changes in your fork, then commit them to your branch.
- As you update your PR and apply changes, mark each conversation as [resolved](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/commenting-on-a-pull-request#resolving-conversations).

> [!NOTE]
> If you run into any merge issues, checkout this [git tutorial](https://github.com/skills/resolve-merge-conflicts).

<div align="center" width="100%">

## Guidelines

</div>

### Basics

As a rule of thumb go with one of the [Google Style Guides](https://google.github.io/styleguide/).

- Make extensive use of the `#region` (`#pragma region $name` for C/C++) feature that comes with VSCode and is a huge benefit when collapsing whole code blocks.

- Never submit code with trailing whitespace.
- Layout: Use 2 spaces for indentation levels. Never tabs!
- Code is read more often than it's written. Code readability is thus something worth optimizing for.
- Try and keep line lengths to 128 characters except for documents like markdown where no line length is enforced.
- Go crazy with log messages! Trace-level log messages in particular can be used copiously and freely (unless in rare cases where they can interfere with performance).
- Use [Doxygen](https://www.doxygen.nl/) styled markup for C-like languages
  - Use #pragma region to cluster code areas (see note above)
  - Use include guards
- Use SPDX notation wherever possible
- Do NOT include a license text as this is already handled by SPDX
- Document more then less: it's always better to have (even for the smallest function) some explanation why it's there ;)

#### Revision Control Hygiene

- Use fast-forward merges and no merge commits.
- Prefix commit message subject lines with the section of code they apply to.
  - Use imperative mood (Example: "x666: Fix Nuclear Winter Overflow").
  - Try to keep the subject line to 50 chars (hard limit: 72 chars).
- Follow up in greater detail in the body of the commit message. The body is separated from the subject line with one blank line. Consider the body of the git commit an email to the future reader of this changeset, so don't be sparse in the commit body, and use it to explain the *what* and *why* of this commit (the "how" part should be obvious from the code change). Lines should be limited to 72 characters.
- Avoid refactoring, whitespace cleanup, or fixing code to match coding guidelines in the same commit as modifying behaviour. Prefer dedicated cleanup commits.

#### Windows

This project is mainly developed on Windows, however a few potential gotchas need to be kept in mind:

- Regular Expressions: Windows uses `\r\n` for line endings. This repo enforces Unix style `\n` line endings.
- Paths: Windows systems use `\` for the path separator. Remember this when hardcoding paths.
- Scripts: Use Python instead of PowerShell. Use PowerShell if not otherwise possible.
  - **Don't use shell scripts! (eg.: bash, zsh, fish, etc.)**
- `Filename too long` error: Windows has a 260 character limit for filenames. Solution:
  - Update Git config: `git config --system core.longpaths true`
  - [Enable Long Paths via PowerShell](https://learn.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation?tabs=powershell#enable-long-paths-in-windows-10-version-1607-and-later):
    ``` powershell
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name
    "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
    ```

### Visual Studio Code

iown-homecontrol is intended to be used with [Visual Studio Code (VSCode) and the Platform.IO extension](../.vscode/settings.json). Essential extensions get automatically recommended on loading the folder. If you are using another IDE feel free to add sane configurations so others can benefit from it.

> [!NOTE]
> When opening the project folder in VSCode you will only see relevant files as the project workspace is configured to hide files which aren't needed for development.

#### Tasks

The repo comes with some useful tasks to help you with development, you can start these tasks by opening the command palette and select `Tasks: Run Task` then select the task you want to run.

When a task is currently running, it can be restarted by opening the command palette and selecting `Tasks: Restart Running Task`, then select the task you want to restart.

<!-- TODO The available tasks are:

Task | Description
-- | --
Task1 | Description1
-->

### Settings and Linter

- **Always** use VSCodes `settings.json` to declare external/extra config files (eg. `pyproject.toml`) wherever possible. This helps devs which don't use VSCode to work with this repo.
- If the linter supports it, put a dot at the beginning of the file name.

### C++

[CppCoreGuideLines]: https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md

- All C++ code must be formatted according to the .clang-format file in the root of the project.
- If in doubt, consult the [C++ Core Guidelines][CppCoreGuidelines]. If the guidelines have an answer, and it works for you, just pick that.
- Use Doxygen doc-blocks copiously.
- All things equal, prefer standard C++ constructs over Boost constructs (see also Boost guidelines).
- Given the option, prefer C++ lambdas over std::bind, and just don't use boost::bind.
- `size_t` is the correct container for all indexing of C++ structures (such as vectors). But keep in mind that the size of `size_t` is *platform-dependent*!
- Use size-specific types whenever interacting with hardware (`int32_t`, etc.). It's very easy to get bitten by incorrect sizes.
- Include include files in the following order: Local headers, other UHD headers, 3rd-party library headers, Boost headers, standard headers. The rationale is to include from most to least specific. Note that clang-format will do this for you.
- Feel free to use modern C/C++ features even if they were not used before! Just make sure they work with the used compilers and dependencies.

#### CMake

- CMake commands are written in lowercase.

### Python

- Target the latest Python Version. At time of writing this is Python 3.12.
- Use Python 3 constructs.
- Follow code layout suggestions in [PEP8](https://www.python.org/dev/peps/pep-0008/) and Docstrings in [PEP257](https://www.python.org/dev/peps/pep-0257/).
- Pylint is good tool for helping with following code guidelines. It's very fussy though, so don't get too worked up about following its suggestions.

Python script boilerplate: [pyton_script_template.py](https://gist.githubusercontent.com/Velocet/51245270c2197023eaa9752c58fddc81/raw/3fd0e646872ac7b5f45a13150a5a3e2eb287c07f/pyton_script_template.py)
