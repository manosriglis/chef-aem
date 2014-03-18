Description
===========
A cookbook to install Adobe Experience Manager and file vault tool.

Requirements
============
CQ5 Quickstart Jar and Filevalt tar file available in a remote location.

## Attributes

* `node['aem']['install_path']` - The install path for AEM defaults to /opt/aem
* `node['aem']['license_customer_name']` - Licence customer name
* `node['aem']['license_download_id']` - Licence download ID
* `node['aem']['aem_remote_path']` - Remote path where CQ Quickstart JAR is located
* `node['aem']['vlt_remote_path']` - Remote path where File Vault tgz file is located

## Recipies

* default - Downloads the JAR CQ Quickstart JAR and File Vault TGZ and installs both. If AEM is installed it starts the instance.