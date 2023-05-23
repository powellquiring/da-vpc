This README file provides details about `Github Actions` in this repo. This action is used to automate the onboarding, validating, and the publishing of the version of an offering to a catalog. Additionally, the versions are scanned by using the IBM CRA scanning functions.

The action is initiated when a new release is created within the repository. 

The action requires the configuration of a secret that has a value of an IBM Cloud account's `API key` that has sufficient IAM permissions to provision resources. See the Git documentation to configure the secret. The secret must be named as `IBMCLOUD_API_KEY`. The remaining settings are defined in the `publish-pipeline.yml` workflow definition file. In order for these `Github actions` to run properly, the content of this directory must be stored in a folder that is called `.github`.

You can find the following steps within the workflow:

1.  Git checkout - Gets the content of the release onto the worker machine that is provisioned to run this workflow.
2.  Install and setup `IBMCLOUD CLI` - Performs the set up that is needed for the remaining steps by installing the IBM Cloud CLI and the necessary plug-ins.
3.  Upload, validate, scan, and publish - Imports to the catalog, runs validation that tests the installation, and publishes within the catalog to the account.
4.  Cleanup deployed resources - Deletes all resources that are created in step 3.

Note: The base assumption with this workflow is that the offering is already created within a catalog. The workflow onboards only new versions of the offering that have resulted from creating a release.
