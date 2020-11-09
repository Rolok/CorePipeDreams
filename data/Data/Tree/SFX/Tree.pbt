Name: "SFX"
RootId: 6217844792821113420
Objects {
  Id: 14040805593646524700
  Name: "Control"
  Transform {
    Location {
      X: -750
      Z: 1750
    }
    Rotation {
    }
    Scale {
      X: 19
      Y: 31.25
      Z: 12.25
    }
  }
  ParentId: 6217844792821113420
  WantsNetworking: true
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  AudioInstance {
    AudioAsset {
      Id: 8396156132179727113
    }
    Volume: 1
    Falloff: 3600
    Radius: 1000
    EnableOcclusion: true
    IsSpatializationEnabled: true
    IsAttenuationEnabled: true
  }
}
Objects {
  Id: 1186142820771801290
  Name: "PlayMusic"
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
  ParentId: 6217844792821113420
  ChildIds: 14611432203252723157
  UnregisteredParameters {
    Overrides {
      Name: "cs:CelestialJourneyMusicConstructionK"
      ObjectReference {
        SelfId: 8255644177617849823
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Script {
    ScriptAsset {
      Id: 15793614496536094868
    }
  }
}
Objects {
  Id: 14611432203252723157
  Name: "ClientContext"
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
  ParentId: 1186142820771801290
  ChildIds: 8255644177617849823
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  NetworkContext {
  }
}
Objects {
  Id: 8255644177617849823
  Name: "\"Celestial Journey\" Music Construction Kit (Sections) 01"
  Transform {
    Location {
      X: -550
      Z: 1500
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 14611432203252723157
  UnregisteredParameters {
    Overrides {
      Name: "bp:Type"
      Enum {
        Value: "mc:emx_celestial_journey_kit:56"
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  Blueprint {
    BlueprintAsset {
      Id: 16779029548864954724
    }
    AudioBP {
      AutoPlay: true
      Volume: 2.76717567
      Falloff: 3600
      Radius: 400
    }
  }
}
