| **Volume Type**                       | **Lifetime** | **Details**                                                                                             |
| ------------------------------------- | ------------ | ------------------------------------------------------------------------------------------------------- |
| **emptyDir**                          | Pod          | Temporary storage for the lifetime of a Pod.                                                            |
| **configMap**                         | Cluster      | Stores configuration data as files or environment variables.                                            |
| **secret**                            | Cluster      | Stores sensitive data, such as passwords or tokens.                                                     |
| **persistentVolumeClaim (PVC)**       | Cluster      | Requests storage from a PersistentVolume.                                                               |
| **persistentVolume (PV)**             | Cluster      | Represents storage resources in the cluster. Managed independently from Pods.                           |
| **hostPath**                          | Node         | Mounts a file or directory from the host node’s filesystem into the Pod.                                |
| **nfs**                               | Cluster      | NFS-based volumes persist beyond Pod lifecycle.                                                         |
| **awsElasticBlockStore (EBS)**        | Cluster      | AWS EBS volumes persist beyond Pod deletion, depending on reclaim policy.                               |
| **azureDisk**                         | Cluster      | Azure Disk volumes persist beyond Pod lifecycle, based on PVC's reclaim policy.                         |
| **gcePersistentDisk**                 | Cluster      | GCP Persistent Disk volumes persist beyond Pod deletion, according to PVC's reclaim policy.             |
| **cephFS**                            | Cluster      | Distributed file system volumes persist beyond Pod lifecycle.                                           |
| **glusterfs**                         | Cluster      | GlusterFS volumes persist beyond Pod deletion, subject to PVC’s reclaim policy.                         |
| **iscsi**                             | Cluster      | iSCSI-based volumes persist beyond Pod lifecycle, subject to PVC’s reclaim policy.                      |
| **cinder**                            | Cluster      | OpenStack Cinder volumes persist beyond Pod lifecycle, according to PVC's reclaim policy.               |
| **local**                             | Node         | Local storage on a node that can persist beyond Pod lifecycle, tied to the node it resides on.          |
| **proj4FS**                           | Cluster      | Persistent volume for project-level file system.                                                        |
| **s3**                                | Cluster      | S3-based volumes persist beyond Pod lifecycle, typically used for object storage.                       |
| **csi (Container Storage Interface)** | Cluster      | Abstracted volume interfaces that provide persistent storage options, based on the specific CSI driver. |
| **azureFile**                         | Cluster      | Azure File share-based volumes persist beyond Pod lifecycle.                                            |
| **quobyte**                           | Cluster      | Quobyte-based volumes persist beyond Pod lifecycle.                                                     |
| **vsphereVolume**                     | Cluster      | vSphere volumes persist beyond Pod deletion, depending on reclaim policy.                               |
| **xfs**                               | Cluster      | XFS volumes persist beyond Pod lifecycle, typically used in enterprise environments.                    |
| **portworx**                          | Cluster      | Portworx volumes provide high-availability, persistent storage beyond Pod lifecycle.                    |
| **flocker**                           | Cluster      | Flocker volumes persist beyond Pod lifecycle, typically used for stateful workloads.                    |
