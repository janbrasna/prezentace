# Mozilla.cz - prezentace

[![Build Status](https://github.com/MozillaCZ/prezentace/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/MozillaCZ/prezentace/actions)

V tomto repositáři najdete naše prezentace z konferencí, setkání a dalších akcí.

## Úpravy obsahu

### Příprava
Abyste byli schopni spustit níže uvedené příkazy, je nutné mít nainstalované [Ruby 3.1](https://www.ruby-lang.org/en/documentation/installation/) a GNU Make.

Před prvním sestavením (nebo po změně souboru `Gemfile`) je potřeba stáhnout potřebné závislosti.
```
$ make prepare
```

### Náhled
Při úpravách vzhledu i obsahu je dobré rovnou se podívat na výsledek. Níže uvedený příkaz sestaví obsah repositáře a zpřístupní ho na lokální adrese http://localhost:4000/.
```
$ make run
```
Příkaz stačí spustit jednou v samostatném terminálu a nechat běžet. Pokud pak ve zdrojových souborech provedete nějakou změnu, Jekyll sestaví stránky znovu. Pro zobrazení efektu změn stačí obnovit načtenou stránku v prohlížeči (*F5*).

## Sestavení statické verze
Pro sestavení webu slouží tento příkaz.
```
$ make build
```
Statická verze stránek je vygenerovaná do adresáře `_site`. Pro nasazení stačí jeho obsah nahrát na server třeba přes FTP.
