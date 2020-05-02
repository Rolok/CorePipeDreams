Name: "Lobby_1"
RootId: 8772518256635736865
Objects {
  Id: 3535679726573886345
  Name: "Lobby Geometry"
  Transform {
    Location {
      Z: 0.000244140625
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 8772518256635736865
  ChildIds: 4191069684466983911
  ChildIds: 5061225149373559828
  UnregisteredParameters {
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Folder {
    IsGroup: true
  }
}
Objects {
  Id: 5061225149373559828
  Name: "Game State Geometry"
  Transform {
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 3535679726573886345
  UnregisteredParameters {
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  TemplateInstance {
    ParameterOverrideMap {
      key: 8334461031128452550
      value {
        Overrides {
          Name: "Name"
          String: "Game State Geometry"
        }
        Overrides {
          Name: "Rotation"
          Rotator {
          }
        }
        Overrides {
          Name: "Scale"
          Vector {
            X: 1
            Y: 1
            Z: 1
          }
        }
        Overrides {
          Name: "cs:Geometry"
          ObjectReference {
            SelfId: 4191069684466983911
          }
        }
        Overrides {
          Name: "cs:ExistsInRoundEnd"
          Bool: false
        }
      }
    }
    TemplateAsset {
      Id: 6017782631687195805
    }
  }
}
Objects {
  Id: 4191069684466983911
  Name: "Geometry"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 3535679726573886345
  ChildIds: 9756844850243600089
  ChildIds: 3041932597277952126
  ChildIds: 16146156526814063416
  ChildIds: 13008034502179404267
  UnregisteredParameters {
  }
  WantsNetworking: true
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Folder {
    IsGroup: true
  }
}
Objects {
  Id: 13008034502179404267
  Name: "Team4Barrier"
  Transform {
    Location {
      X: -1899.99292
      Y: 1899.98755
      Z: 3199.99976
    }
    Rotation {
      Pitch: 4.09811328e-05
      Yaw: -89.999939
      Roll: 89.9996338
    }
    Scale {
      X: 4
      Y: 4
      Z: 0.1
    }
  }
  ParentId: 4191069684466983911
  UnregisteredParameters {
    Overrides {
      Name: "ma:Building_WallInner:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
    Overrides {
      Name: "ma:Building_WallInner2:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
    Overrides {
      Name: "ma:Shared_BaseMaterial:color"
      Color {
        G: 0.299999952
        B: 0.00198676554
        A: 1
      }
    }
    Overrides {
      Name: "ma:Shared_BaseMaterial:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
  }
  WantsNetworking: true
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CoreMesh {
    MeshAsset {
      Id: 391819858045411554
    }
    Teams {
      TeamInt: 4
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    DisableCastShadows: true
    DisableReceiveDecals: true
    StaticMesh {
      Physics {
      }
    }
  }
}
Objects {
  Id: 16146156526814063416
  Name: "Team3Barrier"
  Transform {
    Location {
      X: 3299.98291
      Y: -1699.98804
      Z: 3199.99976
    }
    Rotation {
      Pitch: 1.36603776e-05
      Yaw: -90
      Roll: 89.9996796
    }
    Scale {
      X: 4
      Y: 4
      Z: 0.1
    }
  }
  ParentId: 4191069684466983911
  UnregisteredParameters {
    Overrides {
      Name: "ma:Building_WallInner:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
    Overrides {
      Name: "ma:Building_WallInner2:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
    Overrides {
      Name: "ma:Shared_BaseMaterial:color"
      Color {
        R: 1
        G: 0.0299999714
        B: 0.993575871
        A: 1
      }
    }
    Overrides {
      Name: "ma:Shared_BaseMaterial:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
  }
  WantsNetworking: true
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CoreMesh {
    MeshAsset {
      Id: 391819858045411554
    }
    Teams {
      TeamInt: 3
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    DisableCastShadows: true
    DisableReceiveDecals: true
    StaticMesh {
      Physics {
      }
    }
  }
}
Objects {
  Id: 3041932597277952126
  Name: "Team2Barrier"
  Transform {
    Location {
      X: -1899.99133
      Y: -1699.9978
      Z: 3199.99976
    }
    Rotation {
      Pitch: 4.09811328e-05
      Yaw: -90
      Roll: 89.9996796
    }
    Scale {
      X: 4
      Y: 4
      Z: 0.1
    }
  }
  ParentId: 4191069684466983911
  UnregisteredParameters {
    Overrides {
      Name: "ma:Building_WallInner:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
    Overrides {
      Name: "ma:Building_WallInner2:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
    Overrides {
      Name: "ma:Shared_BaseMaterial:color"
      Color {
        R: 0.470000029
        A: 1
      }
    }
    Overrides {
      Name: "ma:Shared_BaseMaterial:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
  }
  WantsNetworking: true
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CoreMesh {
    MeshAsset {
      Id: 391819858045411554
    }
    Teams {
      TeamInt: 2
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    DisableCastShadows: true
    DisableReceiveDecals: true
    StaticMesh {
      Physics {
      }
    }
  }
}
Objects {
  Id: 9756844850243600089
  Name: "Team1Barrier"
  Transform {
    Location {
      X: 3299.9978
      Y: 1899.97583
      Z: 3199.99976
    }
    Rotation {
      Pitch: 4.78113216e-05
      Yaw: -89.999939
      Roll: 89.9996643
    }
    Scale {
      X: 4
      Y: 4
      Z: 0.1
    }
  }
  ParentId: 4191069684466983911
  UnregisteredParameters {
    Overrides {
      Name: "ma:Building_WallInner:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
    Overrides {
      Name: "ma:Building_WallInner2:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
    Overrides {
      Name: "ma:Shared_BaseMaterial:color"
      Color {
        G: 0.00642341375
        B: 0.97
        A: 1
      }
    }
    Overrides {
      Name: "ma:Shared_BaseMaterial:id"
      AssetReference {
        Id: 17667297456748244602
      }
    }
  }
  WantsNetworking: true
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CoreMesh {
    MeshAsset {
      Id: 391819858045411554
    }
    Teams {
      TeamInt: 1
      IsTeamCollisionEnabled: true
      IsEnemyCollisionEnabled: true
    }
    DisableCastShadows: true
    DisableReceiveDecals: true
    StaticMesh {
      Physics {
      }
    }
  }
}
