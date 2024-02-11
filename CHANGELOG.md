# Changelog

This changelog is updated automatically using release-it.


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