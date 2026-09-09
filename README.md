# Graceful Genetics for Quarto

This repository packages James R. Swift's
[`graceful-genetics`](https://github.com/jamesrswift/graceful-genetics)
Typst paper template as a self-contained Quarto format extension.

## Install as a starter template

From the downloaded archive, run this command in the parent directory where you
want Quarto to create the example project:

```bash
quarto use template /path/to/quarto-graceful-genetics-0.1.0.zip
quarton use template azral1962/quarto-TISE-GG
```

From a published GitHub repository:

```bash
quarto use template OWNER/quarto-graceful-genetics
quarto use template azral1962/quarto-TISE-GG
```

Quarto installs the extension and creates a copy of `template.qmd`,
`references.bib`, and `communication.svg` in a new project.

## Add to an existing Quarto project

From the downloaded archive:

```bash
quarto add /path/to/quarto-graceful-genetics-0.1.0.zip
```

Or, after publishing the repository on GitHub:

```bash
quarto add OWNER/quarto-graceful-genetics
```

Then select the format in your document:

```yaml
format: graceful-genetics-typst
```

## Render

```bash
quarto render template.qmd
```

Quarto includes Typst, so a separate Typst installation is not required.

## Supported metadata

The extension maps these Quarto YAML fields to the Typst title block:

- `title`
- `authors`, including the first affiliation's `department`, `name`, `city`,
  and `country`, plus `email`
- `date`
- `doi`
- `keywords`
- `abstract`
- `venue-primary` and `venue-secondary`

The bundled TeX Gyre Heros and TeX Gyre Pagella fonts make rendering portable.

## Local development

The repository root is directly renderable because the extension lives under
`_extensions/graceful-genetics/`:

```bash
quarto render template.qmd --to graceful-genetics-typst
```

## Credits and license

The original Typst template is by James R. Swift and is released under the
Unlicense. This Quarto adaptation is also released under the Unlicense. See
`THIRD-PARTY-NOTICES.md` for source and font details.
