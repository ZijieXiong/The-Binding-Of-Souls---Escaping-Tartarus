{
  "$GMRoom":"",
  "%Name":"rmDungeon",
  "creationCodeFile":"",
  "inheritCode":false,
  "inheritCreationOrder":false,
  "inheritLayers":false,
  "instanceCreationOrder":[
    {"name":"inst_3FDA5648","path":"rooms/rmDungeon/rmDungeon.yy",},
    {"name":"inst_60378A24","path":"rooms/rmDungeon/rmDungeon.yy",},
    {"name":"inst_15DA0C5","path":"rooms/rmDungeon/rmDungeon.yy",},
  ],
  "isDnd":false,
  "layers":[
    {"$GMRInstanceLayer":"","%Name":"Music","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"","%Name":"inst_15DA0C5","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_15DA0C5","objectId":{"name":"obj_music","path":"objects/obj_music/obj_music.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":128.0,"y":128.0,},
      ],"layers":[],"name":"Music","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRTileLayer":"","%Name":"WallTile","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"WallTile","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":96,"SerialiseWidth":96,"TileCompressedData":[-2146,-2147483648,1,0,-792,-2147483648,1,0,-563,-2147483648,1,0,-816,-2147483648,1,0,-4895,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"dungTileset","path":"tilesets/dungTileset/dungTileset.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRInstanceLayer":"","%Name":"Instances","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"name":"Instances","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRInstanceLayer":"","%Name":"Dungeon","depth":300,"effectEnabled":true,"effectType":null,"gridX":64,"gridY":64,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"","%Name":"inst_3FDA5648","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_3FDA5648","objectId":{"name":"oDungeon","path":"objects/oDungeon/oDungeon.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":0.0,},
        {"$GMRInstance":"","%Name":"inst_60378A24","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_60378A24","objectId":{"name":"obj_camera","path":"objects/obj_camera/obj_camera.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":0.0,},
      ],"layers":[],"name":"Dungeon","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRTileLayer":"","%Name":"Tiles","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Tiles","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":96,"SerialiseWidth":96,"TileCompressedData":[-9216,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tTile","path":"tilesets/tTile/tTile.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRBackgroundLayer":"","%Name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background","properties":[],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "name":"rmDungeon",
  "parent":{
    "name":"Rooms",
    "path":"folders/Rooms.yy",
  },
  "parentRoom":null,
  "physicsSettings":{
    "inheritPhysicsSettings":false,
    "PhysicsWorld":false,
    "PhysicsWorldGravityX":0.0,
    "PhysicsWorldGravityY":10.0,
    "PhysicsWorldPixToMetres":0.1,
  },
  "resourceType":"GMRoom",
  "resourceVersion":"2.0",
  "roomSettings":{
    "Height":1536,
    "inheritRoomSettings":false,
    "persistent":false,
    "Width":1536,
  },
  "sequenceId":null,
  "views":[
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":270,"inherit":false,"objectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":480,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings":{
    "clearDisplayBuffer":true,
    "clearViewBackground":false,
    "enableViews":true,
    "inheritViewSettings":false,
  },
  "volume":1.0,
}