# Contributing to the iown-homecontrol Project <!-- omit in toc -->

Please be sure to read the contribution guidelines before making or requesting a change.

Our full documentation can be found at: [iown-homecontrol](https://velocet.github.io/iown-homecontrol)

## Preamble

> *A foolish consistency is the hobgoblin of little minds, adored by little statesmen and philosophers and divines". Ignoring the little statesmen for a minute, these coding standards are here to make our life *easier*, not simply add additional rules. They are meant as additional guidance for developers, and are not meant to be interpreted as law.*
> - R. W. Emerson

So, ultimately, it is up to the developer to decide how much these guidelines should be heeded when writing code, and up to reviewers how much they are relevant to new submissions.
That said, a consistent codebase is easier to maintain, read, understand, and extend. Choosing personal preferences over these coding guidelines is not a helpful move for anyone and future maintainability.

> ![NOTE]
> Every Contribution is Welcome! ...even if it doesn't follow the rules described here. Better a nonconforming contribution then nothing. Thank You!

This document will give you the project overview, its structure and will try to guide you through the contribution workflow like opening an issue, creating/reviewing/merging a PR and the corresponding documentation and coding rules. If you wish, you can proudly add yourself to the CONTRIBUTORS.md.

### Code of Conduct

This projects [Code of Conduct](CODE_OF_CONDUCT.md) can be found in a seperate file.

## Filing Issues

Before filing an issue, please be sure to read the guidelines.

If you spot a problem, [search if an issue already exists](https://docs.github.com/en/github/searching-for-information-on-github/searching-on-github/searching-issues-and-pull-requests#search-by-the-title-body-or-comments).
If a related issue doesn't exist, you can open a new issue using a relevant [issue form](https://github.com/velocet/iown-homecontrol/issues/new/choose).

- HowTo Solve an Issue
  - Scan through our [existing issues](https://github.com/velocet/iown-homecontrol/issues) to find one that interests you. You can narrow down the search using `labels` as filters.
  - See [Labels](/contributing/how-to-use-labels.md) for more information.
  - As a general rule, we don't assign issues to anyone.
  - If you find an issue to work on, you are welcome to open a PR with a fix.

## Make Changes

- In the UI: Click **Make a contribution** at the bottom of any page to make small changes such as a typo, sentence fix, or a broken link. This takes you to the `.md` file where you can make your changes and [create a pull request](#pull-request) for a review.
- In a Codespace: For information about using a codespace, see "[Working in a codespace](https://github.com/github/docs/blob/main/contributing/codespace.md)."
- Locally
  - [Fork the Repository](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo#fork-an-example-repository)
    - Using GitHub Desktop: [Getting started with GitHub Desktop](https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/getting-started-with-github-desktop).
      - Once Desktop is set up, use it to [fork the repo](https://docs.github.com/en/desktop/contributing-and-collaborating-using-github-desktop/cloning-and-forking-repositories-from-github-desktop).
    - Using the Command Line: I think you don't need any further help...
  - Create a working branch and start with your changes!
  - Commit the changes once you are happy with them.

### Pull Request

When finished with the changes, create a pull request, also known as a PR. Fill the "Ready for Review" template so that we can review your PR. This template helps to understand your changes as well as the purpose of your PR. Don't forget to [link PR to issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue) if you are solving one.

Enable the checkbox to [allow maintainer edits](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/allowing-changes-to-a-pull-request-branch-created-from-a-fork) so the branch can be updated for a merge.

Once you submit your PR, a team member will review your proposal. We may ask questions or request additional information. We may ask for changes to be made before a PR can be merged, either using [suggested changes](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/incorporating-feedback-in-your-pull-request) or pull request comments. You can apply suggested changes directly through the UI. You can make any other changes in your fork, then commit them to your branch.

As you update your PR and apply changes, mark each conversation as [resolved](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/commenting-on-a-pull-request#resolving-conversations).

> ![!NOTE]
> If you run into any merge issues, checkout this [git tutorial](https://github.com/skills/resolve-merge-conflicts) to help you resolve merge conflicts and other issues.


## Project Structure

This project is intended to be used with Visual Studio Code (VSCode) and platform.io. It is assumed that you are knowledgable with Windows (WSL), Linux and some of the used terms and definitions.

> ![NOTE]
> When opening the project folder in VSCode you will only see relevant files as the project workspace is configured to hide files which aren't really helpful for development.

- Project Root
  - .github
    - workflows
  - .vscode
    - .pio
      - lib
      - build_cache
  - docs
  - examples
  - extras
  - include
  - scripts

### Development Enviroment

- [Visual Studio code](https://code.visualstudio.com/)

#### Getting Started

1. Fork the repository.
2. Clone the forked repository to your computer.
3. Open the repository using Visual Studio code.

#### Tasks

The repo comes with some useful tasks to help you with development, you can start these tasks by opening the command palette and select `Tasks: Run Task` then select the task you want to run.

When a task is currently running, it can be restarted by opening the command palette and selecting `Tasks: Restart Running Task`, then select the task you want to restart.

The available tasks are:

Task | Description
-- | --
Task1 | Description1

## Code and Documentation Guidelines

<!--
TODO Copy <https://wiki.rdkcentral.com/display/RDK/Coding+Guideline>
TODO See <https://google.github.io/styleguide/>
TODO See <https://hackmd.io/@Jon97/Sk5QwpuBL#Source>
-->

- Never submit code with trailing whitespace.
- Code layout: We use 4 spaces for indentation levels, and never tabs.
- Code is read more often than it's written. Code readability is thus something worth optimizing for.
- Try and keep line lengths to 79 characters, unless readability suffers. We often have to do fun things like SSH into machines and edit code in a terminal, and do side-by-side views of code on small-ish screens, so this is actually pretty helpful.
- Go crazy with log messages. Trace-level log messages in particular can be used copiously and freely (unless in rare cases where they can interfere with performance). Note that in C++, we have the option of fully compiling out trace-level messages (and even higher levels).

Basic Rules:
- Use [Doxygen](https://www.doxygen.nl/) styled markup for C-like languages
  - See MainPage.h for a style guide
  - Use #pragma region to cluster code areas
  - Use include guards wherever possible
- Use SPDX notation wherever possible
- Do NOT include a license text as this is already handled by SPDX
- Document more then less: it's always better to have (even for the smallest function) some explanation why it's there ;)

### Markdown

- Command ID Template<br><br>
  > | **Name**  | xxx |
  > | --------- | :-: |
  > | **Desc** |     |

### C++

[CppCoreGuideLines]: https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md

- All C++ code must be formatted according to the .clang-format file in the root of the project.
- If in doubt, consult the [C++ Core Guidelines][CppCoreGuidelines]. If the guidelines have an answer, and it works for you, just pick that.
- Use Doxygen doc-blocks copiously.
- All things equal, prefer standard C++ constructs over Boost constructs (see also Boost guidelines).
- Given the option, prefer C++ lambdas over std::bind, and just don't use boost::bind.
- `size_t` is the correct container for all indexing of C++ structures (such as vectors). But keep in mind that the size of `size_t` is *platform-dependent*!
- Use size-specific types whenever interacting with hardware (`int32_t`, etc.). It's very easy to get bitten by incorrect sizes.
- Include include files in the following order: Local headers, other UHD headers, 3rd-party library headers, Boost headers, standard headers. The rationale is to include from most to least specific. This is the best way to catch missing includes (if you were to include the standard header first, it would be available to all include files that come later. If they need that standard header too, they should be including it themselves). Note that clang-format will do this for you.
- Feel free to use modern C/C++ features even if they were not used before! Just make sure they work with the used compilers and dependencies.

### Python

[PEP8]: https://www.python.org/dev/peps/pep-0008/
[Pep257]: https://www.python.org/dev/peps/pep-0257/

- Target at least Python >= 3.8
- Use Python 3 constructs.
- Follow suggestions in [PEP8][Pep8] and [PEP257][Pep257]. The former is about code layout in general, the latter about docstrings.
- Pylint is good tool for helping with following code guidelines. It's very fussy though, so don't get too worked up about following its suggestions.

### CMake

- CMake commands are written in lowercase.

### Revision Control Hygiene

- Use fast-forward merges, and no merge commits.
- Prefix commit message subject lines with the section of code they apply to.
  - Use imperative mood (Example: "x666: Fix Nuclear Winter Overflow").
  - Try to keep the subject line to 50 chars.
  - Subject line hard limit: 72 chars.
- Follow up in greater detail in the body of the commmit message. The body is separated from the subject line with one blank line. Consider the body of the git commit an email to the future reader of this changeset, so don't be sparse in the commit body, and use it to explain the *what* and *why* of this commit (the "how" part should be obvious from the code change). Lines should be limited to 72 characters.
- Avoid refactoring, whitespace cleanup, or fixing code to match coding guidelines in the same commit as modifying behaviour. Prefer dedicated cleanup commits.
- Remember that we ship git repositories, not just code. This means every commit is part of our product and should be treated as such.

### Windows

This project is mainly developed on Windows, however a few potential gotchas need to be kept in mind:

1. Regular Expressions: Windows uses `\r\n` for line endings, while Unix-based systems use `\n`. Therefore, when working on Regular Expressions, use `\r?\n` instead of `\n` in order to support both environments. The Node.js [`os.EOL`](https://nodejs.org/api/os.html#os_os_eol) property can be used to get an OS-specific end-of-line marker.
2. Paths: Windows systems use `\` for the path separator, which would be returned by `path.join` and others. You could use `path.posix`, `path.posix.join` etc and the [slash](https://ghub.io/slash) module, if you need forward slashes - like for constructing URLs - or ensure your code works with either.
3. Bash: Not every Windows developer has a terminal that fully supports Bash, so it's generally preferred to write [scripts](/script) in JavaScript instead of Bash.
4. Filename too long error: There is a 260 character limit for a filename when Git is compiled with `msys`. While the suggestions below are not guaranteed to work and could cause other issues, a few workarounds include:
    - Update Git configuration: `git config --system core.longpaths true`
    - Consider using a different Git client on Windows
