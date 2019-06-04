#### pandoc
- brew install pandoc
- Add **eval "$(pandoc --bash-completion)"** to ${HOME}/.bash_profile
- generate pdf: -o output.df
    - install this first: brew cask install mactex
- generate ppt: -o output.pptx
- pandoc --list-extensions
- pandoc --list-output-formats



```text
geometry: "left=2cm,right=2cm,top=2cm,bottom=2cm"
```

- we can only use beamer to generate pdf, not ppt
- Speaker notes
```md
::: notes

:::

{.smallcaps}
```