# Changelog

This changelog is updated automatically using release-it.


## [0.6.3](https://github.com/juancarlosjr97/release-it-containerized/compare/0.6.2...0.6.3) (2024-03-08)


### Bug Fixes

* updating renovate configuration to fix updating to only node lts versions ([00d4d06](https://github.com/juancarlosjr97/release-it-containerized/commit/00d4d06549e6decfe047617f708c737068d82430)), closes [#33](https://github.com/juancarlosjr97/release-it-containerized/issues/33)


### Chores

* adding constraint to Docker major upgrade using Renovate [skip ci] ([b9e9b55](https://github.com/juancarlosjr97/release-it-containerized/commit/b9e9b554d5252dad42df81724a197f1c4daf1258))
* **deps:** update all dependencies ([50ddc49](https://github.com/juancarlosjr97/release-it-containerized/commit/50ddc49eb2b28394763c1369698b17ebd1025953))
* removing versionCompatibility from renovate configuration [skip ci] ([8962a4b](https://github.com/juancarlosjr97/release-it-containerized/commit/8962a4b8829be85edb0f54a749945f9cde1a3b35))
* removing versioning from renovate configuration due to conflict [skip ci] ([1975f0f](https://github.com/juancarlosjr97/release-it-containerized/commit/1975f0f41f16d95771055a84a64d1ec9c21fbbbe))
* updating renovate and node base image to pick up using LTS [skip ci] ([3cdce26](https://github.com/juancarlosjr97/release-it-containerized/commit/3cdce26505d710a274500c2991f23e7ef13aa2bc))
* updating renovate based on package rules for node with alpine suffix for docker node image [skip ci] ([bc4da3b](https://github.com/juancarlosjr97/release-it-containerized/commit/bc4da3b3a890cbde3f2635050d04848496ddab72))
* updating renovate configuration for node LTS [skip ci] ([f1ea2d1](https://github.com/juancarlosjr97/release-it-containerized/commit/f1ea2d159fd9709a67162f3b322eb438ce7d6cfc))
* updating renovate to allow only updateTypes of minor and patch [skip ci] ([f9c111a](https://github.com/juancarlosjr97/release-it-containerized/commit/f9c111aefb1454ff8be38ef87bd70c1a03e1f709))
* updating renovate to only raise MR for non major [skip ci] ([ddd555b](https://github.com/juancarlosjr97/release-it-containerized/commit/ddd555bc823abced7c8f3b01182f76fc7f5d5e8b))
* updating renovate to only update to patch and minor [skip ci] ([f0fbbdf](https://github.com/juancarlosjr97/release-it-containerized/commit/f0fbbdfeebc4553f772de334f782b004ebf048fe))
* updating renovate to use match with versionCompatibility for node LTS [skip ci] ([5e2a1e1](https://github.com/juancarlosjr97/release-it-containerized/commit/5e2a1e13fd0ee364f50311a1882c9f19e533b6b7))

## [0.6.2](https://github.com/juancarlosjr97/release-it-containerized/compare/0.6.1...0.6.2) (2024-02-25)


### Chores

* adding to Dockerfile the origin of the image ([e33bc8f](https://github.com/juancarlosjr97/release-it-containerized/commit/e33bc8ff22ed90e0eb0b13eb37195f7e662648c1))

## [0.6.1](https://github.com/juancarlosjr97/release-it-containerized/compare/0.6.0...0.6.1) (2024-02-20)


### Tests

* fixing test adding line break ([c6b8422](https://github.com/juancarlosjr97/release-it-containerized/commit/c6b8422cc2c946981daa59261d461695d6f666d3))
* updating tests to only execute when workflow event is a success ([98a62c0](https://github.com/juancarlosjr97/release-it-containerized/commit/98a62c06e81fdf4beb6493ccbcc2ac3f59c51756))
* updating tests to pass only needed command ([7b3c9b4](https://github.com/juancarlosjr97/release-it-containerized/commit/7b3c9b4a2be110e9f9adf9b68a167aef9b210cf7))

## [0.6.0](https://github.com/juancarlosjr97/release-it-containerized/compare/0.5.0...0.6.0) (2024-02-20)


### Features

* adding release-it version to github action template ([42f2774](https://github.com/juancarlosjr97/release-it-containerized/commit/42f2774d02830cf9cb03921b6df0b5a615060b53)), closes [#24](https://github.com/juancarlosjr97/release-it-containerized/issues/24)
* adding to github action to pass SSH Passphrase ([96fdb57](https://github.com/juancarlosjr97/release-it-containerized/commit/96fdb578e7627ce3515b8c7c20e21c0578978896)), closes [#25](https://github.com/juancarlosjr97/release-it-containerized/issues/25)
* removing default command with --ci as it runs always on GH ([73416f7](https://github.com/juancarlosjr97/release-it-containerized/commit/73416f703274e2d59dc602598d116d1c64bf457e)), closes [#17](https://github.com/juancarlosjr97/release-it-containerized/issues/17)


### Code Refactoring

* moving input variables to top level for definition ([06915b1](https://github.com/juancarlosjr97/release-it-containerized/commit/06915b19b75366b4fbc0221be01c25df6bca2288))

## [0.6.0-beta.0](https://github.com/juancarlosjr97/release-it-containerized/compare/0.5.0...0.6.0-beta.0) (2024-02-20)


### Features

* adding release-it version to github action template ([42f2774](https://github.com/juancarlosjr97/release-it-containerized/commit/42f2774d02830cf9cb03921b6df0b5a615060b53)), closes [#24](https://github.com/juancarlosjr97/release-it-containerized/issues/24)
* adding to github action to pass SSH Passphrase ([96fdb57](https://github.com/juancarlosjr97/release-it-containerized/commit/96fdb578e7627ce3515b8c7c20e21c0578978896)), closes [#25](https://github.com/juancarlosjr97/release-it-containerized/issues/25)
* removing default command with --ci as it runs always on GH ([73416f7](https://github.com/juancarlosjr97/release-it-containerized/commit/73416f703274e2d59dc602598d116d1c64bf457e)), closes [#17](https://github.com/juancarlosjr97/release-it-containerized/issues/17)


### Code Refactoring

* moving input variables to top level for definition ([06915b1](https://github.com/juancarlosjr97/release-it-containerized/commit/06915b19b75366b4fbc0221be01c25df6bca2288))

## [0.5.0](https://github.com/juancarlosjr97/release-it-containerized/compare/0.4.4...0.5.0) (2024-02-19)


### Features

* adding outputting information of the current execution script ([4ae0555](https://github.com/juancarlosjr97/release-it-containerized/commit/4ae055579c0f9b863154e494c465824469177be7))
* updating npm configuration to environmental variables to avoid error executing on a npm workspace ([2609baf](https://github.com/juancarlosjr97/release-it-containerized/commit/2609bafae4dbe5b0a625c196c8061fa8901be1ea))


### Bug Fixes

* installing specific release-it version on container execution ([365f1e8](https://github.com/juancarlosjr97/release-it-containerized/commit/365f1e8c0ca595d5aada237e94a8701c47ab2703)), closes [#23](https://github.com/juancarlosjr97/release-it-containerized/issues/23)


### Documentation

* updating CHANGELOG license badge ([6699ed1](https://github.com/juancarlosjr97/release-it-containerized/commit/6699ed17b862445c787baa440cb15c8935d17d82))
* updating CHANGELOG license badge [skip ci] ([6679d4f](https://github.com/juancarlosjr97/release-it-containerized/commit/6679d4ff3628506f516e0c7a50862200dcc93c8d))


### Code Refactoring

* updating entry point script with minor tweaks to commands for more clarity ([2e348ca](https://github.com/juancarlosjr97/release-it-containerized/commit/2e348ca3dabb118cf0868a0e68ad154824cc300d))


### Code Style Changes

* adding missing start of the yaml document [skip ci] ([413ffd1](https://github.com/juancarlosjr97/release-it-containerized/commit/413ffd1ea2763ea96a318452d8c15b32315257be))


### Continuous Integration

* removing setting the RELEASE_IT_VERSION as specific one to let latest to be executed ([0cdf486](https://github.com/juancarlosjr97/release-it-containerized/commit/0cdf486de7b5a096b81e7f3ac5d9431faf8ab589))
* updating release-it version to use 17.0.5 of release-it ([65cdf6a](https://github.com/juancarlosjr97/release-it-containerized/commit/65cdf6acecf954eb1db0a6165d6db32fe35f7931))
* updating release-it version to use v17.0.5 ([787223c](https://github.com/juancarlosjr97/release-it-containerized/commit/787223ce787685f83ca043ec90070f295399c27c))

## [0.5.0-beta.6](https://github.com/juancarlosjr97/release-it-containerized/compare/0.5.0-beta.5...0.5.0-beta.6) (2024-02-19)


### Code Refactoring

* updating entry point script with minor tweaks to commands for more clarity ([2e348ca](https://github.com/juancarlosjr97/release-it-containerized/commit/2e348ca3dabb118cf0868a0e68ad154824cc300d))

## [0.5.0-beta.5](https://github.com/juancarlosjr97/release-it-containerized/compare/0.5.0-beta.4...0.5.0-beta.5) (2024-02-19)


### Features

* adding outputting information of the current execution script ([4ae0555](https://github.com/juancarlosjr97/release-it-containerized/commit/4ae055579c0f9b863154e494c465824469177be7))

## [0.5.0-beta.4](https://github.com/juancarlosjr97/release-it-containerized/compare/0.5.0-beta.3...0.5.0-beta.4) (2024-02-18)


### Continuous Integration

* removing setting the RELEASE_IT_VERSION as specific one to let latest to be executed ([0cdf486](https://github.com/juancarlosjr97/release-it-containerized/commit/0cdf486de7b5a096b81e7f3ac5d9431faf8ab589))

## [0.5.0-beta.3](https://github.com/juancarlosjr97/release-it-containerized/compare/0.5.0-beta.2...0.5.0-beta.3) (2024-02-18)


### Bug Fixes

* installing specific release-it version on container execution ([365f1e8](https://github.com/juancarlosjr97/release-it-containerized/commit/365f1e8c0ca595d5aada237e94a8701c47ab2703)), closes [#23](https://github.com/juancarlosjr97/release-it-containerized/issues/23)

## [0.5.0-beta.2](https://github.com/juancarlosjr97/release-it-containerized/compare/0.5.0-beta.1...0.5.0-beta.2) (2024-02-18)


### Continuous Integration

* updating release-it version to use 17.0.5 of release-it ([65cdf6a](https://github.com/juancarlosjr97/release-it-containerized/commit/65cdf6acecf954eb1db0a6165d6db32fe35f7931))

## [0.5.0-beta.1](https://github.com/juancarlosjr97/release-it-containerized/compare/0.5.0-beta.0...0.5.0-beta.1) (2024-02-18)


### Continuous Integration

* updating release-it version to use v17.0.5 ([787223c](https://github.com/juancarlosjr97/release-it-containerized/commit/787223ce787685f83ca043ec90070f295399c27c))

## [0.5.0-beta.0](https://github.com/juancarlosjr97/release-it-containerized/compare/0.4.4...0.5.0-beta.0) (2024-02-18)


### Features

* updating npm configuration to environmental variables to avoid error executing on a npm workspace ([2609baf](https://github.com/juancarlosjr97/release-it-containerized/commit/2609bafae4dbe5b0a625c196c8061fa8901be1ea))


### Documentation

* updating CHANGELOG license badge ([6699ed1](https://github.com/juancarlosjr97/release-it-containerized/commit/6699ed17b862445c787baa440cb15c8935d17d82))
* updating CHANGELOG license badge [skip ci] ([6679d4f](https://github.com/juancarlosjr97/release-it-containerized/commit/6679d4ff3628506f516e0c7a50862200dcc93c8d))


### Code Style Changes

* adding missing start of the yaml document [skip ci] ([413ffd1](https://github.com/juancarlosjr97/release-it-containerized/commit/413ffd1ea2763ea96a318452d8c15b32315257be))

## [0.4.4](https://github.com/juancarlosjr97/release-it-containerized/compare/0.4.3...0.4.4) (2024-02-17)


### Chores

* adding to readme codacy for project and code quality ([06adbd8](https://github.com/juancarlosjr97/release-it-containerized/commit/06adbd8a7a1056c9eff67f7dd38528d54c357684))

## [0.4.3](https://github.com/juancarlosjr97/release-it-containerized/compare/0.4.2...0.4.3) (2024-02-16)


### Code Refactoring

* updating context to release-it-containerized ([f49cca8](https://github.com/juancarlosjr97/release-it-containerized/commit/f49cca8f05b3415c113733ac4ac99a954c0d3630))

## [0.4.2](https://github.com/juancarlosjr97/release-it-containerized/compare/0.4.1...0.4.2) (2024-02-16)


### Chores

* **deps:** update node.js to v20.11.1 ([1914931](https://github.com/juancarlosjr97/release-it-containerized/commit/19149313aa3fcae4b427cb83ef0ddadf5a5c6c14))

## [0.4.1](https://github.com/juancarlosjr97/release-it-containerized/compare/0.4.0...0.4.1) (2024-02-13)


### Documentation

* adding code of conduct [skip ci] ([d120723](https://github.com/juancarlosjr97/release-it-containerized/commit/d120723fa0a3f00ddf052b551e5e18b3028c6eec)), closes [#14](https://github.com/juancarlosjr97/release-it-containerized/issues/14)

## [0.4.0](https://github.com/juancarlosjr97/release-it-containerized/compare/0.3.0...0.4.0) (2024-02-11)


### Features

* updating gh action to make the gh token as optional ([f83f7a3](https://github.com/juancarlosjr97/release-it-containerized/commit/f83f7a3a3f4e6f1efc284166b06bd2584f646f44))


### Documentation

* improvements to the documentation for the input variables to run the tool ([da6ba47](https://github.com/juancarlosjr97/release-it-containerized/commit/da6ba479f8afebaafa82e1096c9f788b9014202c))

## [0.3.0](https://github.com/juancarlosjr97/release-it-containerized/compare/0.2.2...0.3.0) (2024-02-11)


### Features

* adding renovate to automated dependency management and releases ([4ae2dbf](https://github.com/juancarlosjr97/release-it-containerized/commit/4ae2dbf8d1463e61f5ffb4d3680323ad11806029)), closes [#9](https://github.com/juancarlosjr97/release-it-containerized/issues/9)

## [0.2.2](https://github.com/juancarlosjr97/release-it-containerized/compare/0.2.1...0.2.2) (2024-02-11)


### Chores

* sorting a-z variables and inputs ([025ccfd](https://github.com/juancarlosjr97/release-it-containerized/commit/025ccfddfd28b1f90095484ca5c317b9ff2a98ce))


### Documentation

* adding usage and example to run with GitHub Actions ([fd48974](https://github.com/juancarlosjr97/release-it-containerized/commit/fd48974c2c5ef2e6f7d781eb2d2f2bbc7b595b09)), closes [#7](https://github.com/juancarlosjr97/release-it-containerized/issues/7)

## [0.2.1](https://github.com/juancarlosjr97/release-it-containerized/compare/0.2.0...0.2.1) (2024-02-11)


### Chores

* change sorting for type of changes for priority structure ([2d5748f](https://github.com/juancarlosjr97/release-it-containerized/commit/2d5748fd25325227cd11c2cc781993cb3c7562fa))

## [0.2.0](https://github.com/juancarlosjr97/release-it-containerized/compare/0.1.0...0.2.0) (2024-02-11)


### Bug Fixes

* fixing incorrect image repository to the action ([740424d](https://github.com/juancarlosjr97/release-it-containerized/commit/740424dde35a8f57118bf315be56338c5959c2b8)), closes [#7](https://github.com/juancarlosjr97/release-it-containerized/issues/7)


### Code Refactoring

* adding back silent to npm install to container entry point script ([ec9c67d](https://github.com/juancarlosjr97/release-it-containerized/commit/ec9c67d76965bd653d1d2f77cc46b3d57cf4636c))
* replacing SSH_PRIVATE_KEY_FILE to SSH_PRIVATE_KEY ([277c000](https://github.com/juancarlosjr97/release-it-containerized/commit/277c00088427d35155527ed7f7fda98cd010d8a1))


### Continuous Integration

* improving release flow to run when test workflow has passed ([e16c20f](https://github.com/juancarlosjr97/release-it-containerized/commit/e16c20fc637e04eb8ba3070287899569b1ada0a6))


### Features

* adding template for github action ([c6dd699](https://github.com/juancarlosjr97/release-it-containerized/commit/c6dd699f7fc5f72bdba078c3754ef3c1ae24e666)), closes [#7](https://github.com/juancarlosjr97/release-it-containerized/issues/7)

## [0.1.1-beta.0](https://github.com/juancarlosjr97/release-it-containerized/compare/0.1.0...0.1.1-beta.0) (2024-02-11)


### Code Refactoring

* replacing SSH_PRIVATE_KEY_FILE to SSH_PRIVATE_KEY ([277c000](https://github.com/juancarlosjr97/release-it-containerized/commit/277c00088427d35155527ed7f7fda98cd010d8a1))

## [0.1.0](https://github.com/juancarlosjr97/release-it-containerized/compare/0.1.0-beta.3...0.1.0) (2024-02-11)


### Chores

* adding .gitignore ([1212138](https://github.com/juancarlosjr97/release-it-containerized/commit/1212138f62c6e11fc9d73b1f1face12e747306a0))
* adding VERSION file to keep track of version on the project ([b658d39](https://github.com/juancarlosjr97/release-it-containerized/commit/b658d39928e6860dd2d2458f78c516ebfe54a7f0))
* replacing release it with JS file to handle preRelease configuration ([14e31db](https://github.com/juancarlosjr97/release-it-containerized/commit/14e31db6421214ab8d9652f0cc33918ad40eced4))
* updating test workflow name ([6e3710d](https://github.com/juancarlosjr97/release-it-containerized/commit/6e3710d8d6b60b9c064e918645a9c35adf3ce4f3)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)


### Code Refactoring

* moving tag and build directory to the last bit ([b7690f4](https://github.com/juancarlosjr97/release-it-containerized/commit/b7690f440f3e775f882e65699d46e6a4cab15257)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* setting docker run as multiline ([99bc954](https://github.com/juancarlosjr97/release-it-containerized/commit/99bc954678c6b4a6002053e5c3166763c33b0169)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* standarizing  messages when GPG or SSH is not set ([4b50741](https://github.com/juancarlosjr97/release-it-containerized/commit/4b507412e178f16fb338f8450952f4283c619ed0)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)


### Code Style Changes

* formatting correctly script to run docker on the workflow ([9d55c88](https://github.com/juancarlosjr97/release-it-containerized/commit/9d55c8856de5b298e44e902db719b1fb5ee4523d)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* formatting yaml file ([d5d1271](https://github.com/juancarlosjr97/release-it-containerized/commit/d5d1271219c38ce16790041ebd64d57551c850a4)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* formatting yaml file with correct indentation ([2952169](https://github.com/juancarlosjr97/release-it-containerized/commit/2952169c7a214fa4489386796bc6a069b10d2444)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)


### Continuous Integration

* adding beta workflow to release beta version ([16c2584](https://github.com/juancarlosjr97/release-it-containerized/commit/16c2584efcbb931dbff3f29932f6c1760a0db2c2)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding fetch-depth as 0 to get all history ([8c24add](https://github.com/juancarlosjr97/release-it-containerized/commit/8c24add31fbf63934c53707061636b5a3958a4b3)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding ghcr.io to tag for build image for GitHub registry ([d367f21](https://github.com/juancarlosjr97/release-it-containerized/commit/d367f210df146592788a62da25bac2b75afa9897)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding initial workflow to test the build of the image ([567c7ac](https://github.com/juancarlosjr97/release-it-containerized/commit/567c7ac3972b638a68b44bd2e414f2ec84a3c67b)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding permissions to beta job for the GITHUB_TOKEN ([9fec133](https://github.com/juancarlosjr97/release-it-containerized/commit/9fec1335f456893a67751bfd000bd37a2f075d9a)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding quotes to volume ([bf7a264](https://github.com/juancarlosjr97/release-it-containerized/commit/bf7a264907d1e5b653bfa8037671e73168147b26)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding test with GPG and SSH ([038009d](https://github.com/juancarlosjr97/release-it-containerized/commit/038009dc04005268b3783425e1eef99955ca2692)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding test with GPG and without SSH ([4bd6881](https://github.com/juancarlosjr97/release-it-containerized/commit/4bd68819b4e766d09a7b2edcf99c0ec843f441e3)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding to SSH_PRIVATE_KEY_FILE double quotes to avoid docker run issue ([cb9d0ea](https://github.com/juancarlosjr97/release-it-containerized/commit/cb9d0ea0f69c5c6a03b557666338e5cfb6d604ae)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* docker build and docker run as one single job ([20fbaa7](https://github.com/juancarlosjr97/release-it-containerized/commit/20fbaa76bf24efe15f3f923effc233b0bf2d3e9d)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* moving permissions to global job ([9e58856](https://github.com/juancarlosjr97/release-it-containerized/commit/9e58856149e222d32d26e75267dd1285e0f91db4)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* removing test on pull_request ([a387ee1](https://github.com/juancarlosjr97/release-it-containerized/commit/a387ee1bef101bea58dadf049dde8b406c7e69f6)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* run the beta release job as root as it is running inside a container ([7e7aa6b](https://github.com/juancarlosjr97/release-it-containerized/commit/7e7aa6b51ac05e7ab5e292795663d2437f8d5ad2))
* testing release plain on dry-run ([f2cdc22](https://github.com/juancarlosjr97/release-it-containerized/commit/f2cdc22cdc7c13960314a8adaa85dbf182464014)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* testing setting the vars directly ([6225e3e](https://github.com/juancarlosjr97/release-it-containerized/commit/6225e3e7e99f337010f6c79cfbc34dcf12bc4ba8)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* turning docker run into a single line command instead of multiline ([0053c4e](https://github.com/juancarlosjr97/release-it-containerized/commit/0053c4e1220ef5ca89a1312137e220c97124797e)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating GITHUB_TOKEN environmental variable to use secret directly ([871bd94](https://github.com/juancarlosjr97/release-it-containerized/commit/871bd94a682374ab1de4ef67a136cc946150623e))
* updating GITHUB_TOKEN to use BRANCHES_GITHUB_TOKEN from secrets ([b6697a3](https://github.com/juancarlosjr97/release-it-containerized/commit/b6697a3daf705947463aa6de74f6b2fde3ef97a9)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating GITHUB_TOKEN with double quotes ([16613f9](https://github.com/juancarlosjr97/release-it-containerized/commit/16613f96976576e97e7a56c1982411b5942355c8))
* updating image tag name on the test job ([ee5b21c](https://github.com/juancarlosjr97/release-it-containerized/commit/ee5b21cef27845af6810a55b0b9819d6958c9e6a)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating permissions for contents scope to write ([8992d54](https://github.com/juancarlosjr97/release-it-containerized/commit/8992d541d16e0948ec6c303caec77ec6d84ce8ee)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating permissions for contents scope to write-all ([7907f83](https://github.com/juancarlosjr97/release-it-containerized/commit/7907f831bfc9b9c2a3589cce4f8b7f40377d6b5e)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating test workflow to run ([ab8a4fc](https://github.com/juancarlosjr97/release-it-containerized/commit/ab8a4fcbee042ce55005f8fcabed335b6367d04b)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)


### Documentation

* adding acknowledgment for release-it ([3955e1d](https://github.com/juancarlosjr97/release-it-containerized/commit/3955e1d194c9b3fb522b33675d5bfa6116d50c41)), closes [#2](https://github.com/juancarlosjr97/release-it-containerized/issues/2)
* adding additional introduction to the project ([0d953bb](https://github.com/juancarlosjr97/release-it-containerized/commit/0d953bb681133cc589c16c74e65fe340cc17b7f2)), closes [#1](https://github.com/juancarlosjr97/release-it-containerized/issues/1)
* adding code owners file ([80c3d22](https://github.com/juancarlosjr97/release-it-containerized/commit/80c3d224641bf05a1663916fed1ad6e0d21aa2f9)), closes [#13](https://github.com/juancarlosjr97/release-it-containerized/issues/13)
* adding initial README with project purpose ([4470735](https://github.com/juancarlosjr97/release-it-containerized/commit/44707359613154d13b0833b706dc7931cd7300d6)), closes [#1](https://github.com/juancarlosjr97/release-it-containerized/issues/1)
* adding license  ([1a86863](https://github.com/juancarlosjr97/release-it-containerized/commit/1a86863d8af4a8c59c95d2083df86ab977d5b2b8)), closes [#11](https://github.com/juancarlosjr97/release-it-containerized/issues/11)


### Features

* adding dockerfile to build the image around release-it with bash,git, gpg and ssh to run release-it within the environment ([c1e552b](https://github.com/juancarlosjr97/release-it-containerized/commit/c1e552b3064adf16bd9ed15f0c05f8a14f8f17b3)), closes [#3](https://github.com/juancarlosjr97/release-it-containerized/issues/3)
* adding handling of multiple plugins in a list ([72d041a](https://github.com/juancarlosjr97/release-it-containerized/commit/72d041ab79d80997c0732fd5ae7b8f22ecf12561)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding release configuration for release-it ([4d4ce31](https://github.com/juancarlosjr97/release-it-containerized/commit/4d4ce317357badd64e4a1dfc55e78c8052e4d707)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding release on main and develop branches for release-it containerized ([49ae0cf](https://github.com/juancarlosjr97/release-it-containerized/commit/49ae0cfd51703b40941443f931766cfd8c0ffa96)), closes [#5](https://github.com/juancarlosjr97/release-it-containerized/issues/5)
* removing beta workflow release in favor of package release to handle on published new release on GitHub ([fe9a588](https://github.com/juancarlosjr97/release-it-containerized/commit/fe9a588bfac4e3c15134ba1224a8540a3e926833)), closes [#6](https://github.com/juancarlosjr97/release-it-containerized/issues/6)
* removing ownership set to directory ([f30772d](https://github.com/juancarlosjr97/release-it-containerized/commit/f30772d6cbb7a68f72cb3b7f070579fe97105656)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)

## [0.1.0-beta.3](https://github.com/juancarlosjr97/release-it-containerized/compare/0.1.0-beta.2...0.1.0-beta.3) (2024-02-11)


### Documentation

* adding code owners file ([80c3d22](https://github.com/juancarlosjr97/release-it-containerized/commit/80c3d224641bf05a1663916fed1ad6e0d21aa2f9)), closes [#13](https://github.com/juancarlosjr97/release-it-containerized/issues/13)

## [0.1.0-beta.2](https://github.com/juancarlosjr97/release-it-containerized/compare/0.1.0-beta.1...0.1.0-beta.2) (2024-02-11)


### Documentation

* adding license  ([1a86863](https://github.com/juancarlosjr97/release-it-containerized/commit/1a86863d8af4a8c59c95d2083df86ab977d5b2b8)), closes [#11](https://github.com/juancarlosjr97/release-it-containerized/issues/11)

## [0.1.0-beta.1](https://github.com/juancarlosjr97/release-it-containerized/compare/0.1.0-beta.0...0.1.0-beta.1) (2024-02-11)


### Chores

* adding VERSION file to keep track of version on the project ([b658d39](https://github.com/juancarlosjr97/release-it-containerized/commit/b658d39928e6860dd2d2458f78c516ebfe54a7f0))
* replacing release it with JS file to handle preRelease configuration ([14e31db](https://github.com/juancarlosjr97/release-it-containerized/commit/14e31db6421214ab8d9652f0cc33918ad40eced4))


### Features

* adding handling of multiple plugins in a list ([72d041a](https://github.com/juancarlosjr97/release-it-containerized/commit/72d041ab79d80997c0732fd5ae7b8f22ecf12561)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding release on main and develop branches for release-it containerized ([49ae0cf](https://github.com/juancarlosjr97/release-it-containerized/commit/49ae0cfd51703b40941443f931766cfd8c0ffa96)), closes [#5](https://github.com/juancarlosjr97/release-it-containerized/issues/5)
* removing beta workflow release in favor of package release to handle on published new release on GitHub ([fe9a588](https://github.com/juancarlosjr97/release-it-containerized/commit/fe9a588bfac4e3c15134ba1224a8540a3e926833)), closes [#6](https://github.com/juancarlosjr97/release-it-containerized/issues/6)

## 0.1.0-beta.0 (2024-02-10)


### Chores

* adding .gitignore ([1212138](https://github.com/juancarlosjr97/release-it-containerized/commit/1212138f62c6e11fc9d73b1f1face12e747306a0))
* updating test workflow name ([6e3710d](https://github.com/juancarlosjr97/release-it-containerized/commit/6e3710d8d6b60b9c064e918645a9c35adf3ce4f3)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)


### Code Refactoring

* moving tag and build directory to the last bit ([b7690f4](https://github.com/juancarlosjr97/release-it-containerized/commit/b7690f440f3e775f882e65699d46e6a4cab15257)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* setting docker run as multiline ([99bc954](https://github.com/juancarlosjr97/release-it-containerized/commit/99bc954678c6b4a6002053e5c3166763c33b0169)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* standarizing  messages when GPG or SSH is not set ([4b50741](https://github.com/juancarlosjr97/release-it-containerized/commit/4b507412e178f16fb338f8450952f4283c619ed0)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)


### Code Style Changes

* formatting correctly script to run docker on the workflow ([9d55c88](https://github.com/juancarlosjr97/release-it-containerized/commit/9d55c8856de5b298e44e902db719b1fb5ee4523d)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* formatting yaml file ([d5d1271](https://github.com/juancarlosjr97/release-it-containerized/commit/d5d1271219c38ce16790041ebd64d57551c850a4)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* formatting yaml file with correct indentation ([2952169](https://github.com/juancarlosjr97/release-it-containerized/commit/2952169c7a214fa4489386796bc6a069b10d2444)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)


### Continuous Integration

* adding beta workflow to release beta version ([16c2584](https://github.com/juancarlosjr97/release-it-containerized/commit/16c2584efcbb931dbff3f29932f6c1760a0db2c2)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding fetch-depth as 0 to get all history ([8c24add](https://github.com/juancarlosjr97/release-it-containerized/commit/8c24add31fbf63934c53707061636b5a3958a4b3)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding ghcr.io to tag for build image for GitHub registry ([d367f21](https://github.com/juancarlosjr97/release-it-containerized/commit/d367f210df146592788a62da25bac2b75afa9897)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding initial workflow to test the build of the image ([567c7ac](https://github.com/juancarlosjr97/release-it-containerized/commit/567c7ac3972b638a68b44bd2e414f2ec84a3c67b)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding permissions to beta job for the GITHUB_TOKEN ([9fec133](https://github.com/juancarlosjr97/release-it-containerized/commit/9fec1335f456893a67751bfd000bd37a2f075d9a)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding quotes to volume ([bf7a264](https://github.com/juancarlosjr97/release-it-containerized/commit/bf7a264907d1e5b653bfa8037671e73168147b26)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding test with GPG and SSH ([038009d](https://github.com/juancarlosjr97/release-it-containerized/commit/038009dc04005268b3783425e1eef99955ca2692)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding test with GPG and without SSH ([4bd6881](https://github.com/juancarlosjr97/release-it-containerized/commit/4bd68819b4e766d09a7b2edcf99c0ec843f441e3)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* adding to SSH_PRIVATE_KEY_FILE double quotes to avoid docker run issue ([cb9d0ea](https://github.com/juancarlosjr97/release-it-containerized/commit/cb9d0ea0f69c5c6a03b557666338e5cfb6d604ae)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* docker build and docker run as one single job ([20fbaa7](https://github.com/juancarlosjr97/release-it-containerized/commit/20fbaa76bf24efe15f3f923effc233b0bf2d3e9d)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* moving permissions to global job ([9e58856](https://github.com/juancarlosjr97/release-it-containerized/commit/9e58856149e222d32d26e75267dd1285e0f91db4)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* removing test on pull_request ([a387ee1](https://github.com/juancarlosjr97/release-it-containerized/commit/a387ee1bef101bea58dadf049dde8b406c7e69f6)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* run the beta release job as root as it is running inside a container ([7e7aa6b](https://github.com/juancarlosjr97/release-it-containerized/commit/7e7aa6b51ac05e7ab5e292795663d2437f8d5ad2))
* testing release plain on dry-run ([f2cdc22](https://github.com/juancarlosjr97/release-it-containerized/commit/f2cdc22cdc7c13960314a8adaa85dbf182464014)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* testing setting the vars directly ([6225e3e](https://github.com/juancarlosjr97/release-it-containerized/commit/6225e3e7e99f337010f6c79cfbc34dcf12bc4ba8)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* turning docker run into a single line command instead of multiline ([0053c4e](https://github.com/juancarlosjr97/release-it-containerized/commit/0053c4e1220ef5ca89a1312137e220c97124797e)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating GITHUB_TOKEN environmental variable to use secret directly ([871bd94](https://github.com/juancarlosjr97/release-it-containerized/commit/871bd94a682374ab1de4ef67a136cc946150623e))
* updating GITHUB_TOKEN to use BRANCHES_GITHUB_TOKEN from secrets ([b6697a3](https://github.com/juancarlosjr97/release-it-containerized/commit/b6697a3daf705947463aa6de74f6b2fde3ef97a9)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating GITHUB_TOKEN with double quotes ([16613f9](https://github.com/juancarlosjr97/release-it-containerized/commit/16613f96976576e97e7a56c1982411b5942355c8))
* updating image tag name on the test job ([ee5b21c](https://github.com/juancarlosjr97/release-it-containerized/commit/ee5b21cef27845af6810a55b0b9819d6958c9e6a)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating permissions for contents scope to write ([8992d54](https://github.com/juancarlosjr97/release-it-containerized/commit/8992d541d16e0948ec6c303caec77ec6d84ce8ee)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating permissions for contents scope to write-all ([7907f83](https://github.com/juancarlosjr97/release-it-containerized/commit/7907f831bfc9b9c2a3589cce4f8b7f40377d6b5e)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* updating test workflow to run ([ab8a4fc](https://github.com/juancarlosjr97/release-it-containerized/commit/ab8a4fcbee042ce55005f8fcabed335b6367d04b)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)


### Documentation

* adding acknowledgment for release-it ([3955e1d](https://github.com/juancarlosjr97/release-it-containerized/commit/3955e1d194c9b3fb522b33675d5bfa6116d50c41)), closes [#2](https://github.com/juancarlosjr97/release-it-containerized/issues/2)
* adding additional introduction to the project ([0d953bb](https://github.com/juancarlosjr97/release-it-containerized/commit/0d953bb681133cc589c16c74e65fe340cc17b7f2)), closes [#1](https://github.com/juancarlosjr97/release-it-containerized/issues/1)
* adding initial README with project purpose ([4470735](https://github.com/juancarlosjr97/release-it-containerized/commit/44707359613154d13b0833b706dc7931cd7300d6)), closes [#1](https://github.com/juancarlosjr97/release-it-containerized/issues/1)


### Features

* adding dockerfile to build the image around release-it with bash,git, gpg and ssh to run release-it within the environment ([c1e552b](https://github.com/juancarlosjr97/release-it-containerized/commit/c1e552b3064adf16bd9ed15f0c05f8a14f8f17b3)), closes [#3](https://github.com/juancarlosjr97/release-it-containerized/issues/3)
* adding release configuration for release-it ([4d4ce31](https://github.com/juancarlosjr97/release-it-containerized/commit/4d4ce317357badd64e4a1dfc55e78c8052e4d707)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
* removing ownership set to directory ([f30772d](https://github.com/juancarlosjr97/release-it-containerized/commit/f30772d6cbb7a68f72cb3b7f070579fe97105656)), closes [#4](https://github.com/juancarlosjr97/release-it-containerized/issues/4)
