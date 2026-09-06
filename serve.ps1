$ErrorActionPreference = "Stop"

$rubyBin = "C:\Ruby33-x64\bin"
$rubyExecutable = Join-Path $rubyBin "ruby.exe"

if (-not (Test-Path -LiteralPath $rubyExecutable)) {
    throw "Ruby 3.3 was not found at $rubyExecutable. Install Ruby+Devkit 3.3 or update the path in serve.ps1."
}

$env:Path = "$rubyBin;$env:Path"

Write-Host "Using $(ruby --version)" -ForegroundColor Cyan
Write-Host "Starting Jekyll at http://localhost:4000" -ForegroundColor Cyan

bundle exec jekyll serve --livereload

if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
