
This action builds a nginx module using the nginx build process..

## Inputs

### `nginx-version`

a git revision on repository https://github.com/nginx/nginx

## Outputs

Currently no outputs are defined

## Example usage

uses: jwes/nginx-module-build-action@master
with:
  nginx-version: "release-1.18.0"
