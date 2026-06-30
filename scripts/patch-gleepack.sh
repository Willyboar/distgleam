#!/bin/sh
# Patch gleepack's target.gleam to read GITHUB_TOKEN for GitHub API auth.
# Workaround for "Failed to parse releases response" in CI due to
# unauthenticated API rate limiting.

TARGET=build/packages/gleepack/src/gleepack/target.gleam

# Add envoy import after the snag import line
sed -i '' '/^import snag/a\
import envoy
' "$TARGET"

# Add GITHUB_TOKEN auth header in gh_get, after the accept header line
sed -i '' 's/  let req = request.set_header(req, "accept", "application\/vnd.github+json")$/  let req = request.set_header(req, "accept", "application\/vnd.github+json")\
  let req = case envoy.get("GITHUB_TOKEN") {\
    Ok(token) -> request.set_header(req, "authorization", "Bearer " <> token)\
    _ -> req\
  }/' "$TARGET"

echo "Patched gleepack gh_get for GITHUB_TOKEN auth"
