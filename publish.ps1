<#
Publish script for Hugo blog (PowerShell)
Usage:
  .\publish.ps1 -GitHubRepo "USERNAME/REPO" -Visibility "public"
If you already have remote `origin` set, omit GitHubRepo and the script will push to origin.
#>
param(
  [string]$GitHubRepo = "",
  [ValidateSet("public","private")][string]$Visibility = "public"
)

Write-Host "Updating submodules..."
git submodule update --init --recursive

Write-Host "Staging changes..."
git add .

if (-not (git diff --cached --quiet)) {
  Write-Host "Committing changes..."
  git commit -m "Finalize site: content and styles"
} else {
  Write-Host "No changes to commit."
}

$origin = git remote get-url origin 2>$null
if (-not $origin) {
  if ($GitHubRepo -ne "") {
    if (Get-Command gh -ErrorAction SilentlyContinue) {
      Write-Host "Creating repo with gh and pushing..."
      gh repo create $GitHubRepo --$Visibility --source=. --remote=origin --push
    } else {
      Write-Host "No remote origin and 'gh' CLI not found."
      Write-Host "Add remote manually, then run: git push -u origin main"
      Write-Host "Example:"
      Write-Host "  git remote add origin https://github.com/USERNAME/REPO.git"
      Write-Host "  git branch -M main"
      Write-Host "  git push -u origin main"
      exit 1
    }
  } else {
    Write-Host "No remote origin set. Provide -GitHubRepo or add origin manually."
    exit 1
  }
} else {
  Write-Host "Pushing to existing origin..."
  git branch -M main
  git push -u origin main
}

Write-Host "Push complete. If you configured GitHub Actions, the workflow will deploy to gh-pages shortly."
Write-Host "Check: https://github.com/<USERNAME>/<REPO>/actions and Settings -> Pages to confirm deployment."

