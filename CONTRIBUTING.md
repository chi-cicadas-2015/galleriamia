## Galleria Mia Workflow

* This file outlines our workflows for pull requests and code reviews
* All pull requests and merges must adhere to these protocols.
<br><br><br>

### Opening Branches
New branch names are in snake case; they begin with the contributor's initials, followed by the branch's feature / area, and then a cue regarding its purpose (or some other differentiator).

### Commits
Rather than using the -m switch, please commit without. When the editor opens, write a succinct commit message in the first line, followed by a blank line and then a paragraph (or more) that give additional detail about what the branch contains.

### Pull Request Workflow
1. Set git user (weare/iam)
2. Create a branch named for the feature/object you are working on
3. Write Code
4. Commit the code with a good commit message
5. Commits that include views must include screenshot(s) in the Merge file markdown. Screenshot image files belong in the public/img folders
6. Push the branch to Github (after pulling master and merging)
7. Create a Pull Request
8. Hand off to a Reviewer (a team member who did not write any of the code)

### Code Review Workflow

1. Reviewer inspects all changes in the pull request
2. If not satisfactory, Reviewer discusses defects with Submitter; close request without merging
3. If satisfactory, Reviewer adds comments on Github citing the review findings etc.
4. Reviewer merges the Pull Request

<br>
#### Review Findings
Comments should be brief but at the same time reflect the reviewer's findings as to whether the code makes sense,
adheres to style guidelines, and follows other relevant procedures.

<br><br><br>
### Code Style
- Styleguides
  - [AirBnB Ruby Styleguide](https://github.com/airbnb/ruby)
  - [AirBnB JavaScript Styleguide](https://github.com/airbnb/javascript)
