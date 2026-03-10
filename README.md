# Woodgrove Northwind Secure

Secure version of the Woodgrove Northwind application, used to demonstrate **Defender for Cloud CLI with blocking capabilities**.

> This repo uses up-to-date dependencies and a secure base image (`node:22-alpine`) so the Defender CLI scan **passes** and the pipeline succeeds. If vulnerabilities are introduced, the pipeline **blocks deployment**.

## How It Works

| Repo | Image | Defender CLI | Result |
|------|-------|-------------|--------|
| [woodgrove-northwind](https://github.com/build25-woodgrove/woodgrove-northwind) | `node:14-alpine` + vulnerable deps | Non-blocking (`continue-on-error`) | ⚠️ Scan finds vulns, pipeline continues |
| **woodgrove-northwind-secure** (this repo) | `node:22-alpine` + current deps | **Blocking** (no `continue-on-error`) | ✅ Scan passes, pipeline succeeds |

## Setup

1. Configure repo variables and secrets (same as main repo):
   - Variable: `ALPINE_ACR_ENDPOINT`
   - Secrets: `ALPINE_ACR_USERNAME`, `ALPINE_ACR_PASSWORD`
2. Push to `main` to trigger the blocking pipeline
