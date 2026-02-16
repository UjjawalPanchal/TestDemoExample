# test_project

Test Project foe introduction

## TODO's (9 Feb)

Topics

1. Parse Json Response
2. Create Object model class

### Parse JSON to String and create model

    TracksResponseModel.fromJson(Map<String, dynamic> json) {
        totalRecords = json['totalRecords'];
        if (json['tracks'] != null) {
            tracks = <TrackModel>[];
            json['tracks'].forEach((v) {
            tracks!.add(TrackModel.fromJson(v));
        });
        }
    }
