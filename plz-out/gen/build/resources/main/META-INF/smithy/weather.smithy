namespace example.weather

/// Provides weather forecasts.
@title("Weather")
@aws.protocols#restJson1
service Weather {
    version: "2006-03-01", 
    resources: [City]
}

resource City {
    identifiers: { 
        cityId: CityId
    },
    read: GetCity,
}

// "pattern" is a trait.
@pattern("^[A-Za-z0-9 ]+$")
string CityId

/// Get Cities 
@readonly
@http(
    method: "GET", 
    uri: "/city/{cityId}"
)
operation GetCity {
    input: GetCityInput,
    output: GetCityOutput,
    errors: [NoSuchResource]
}

structure GetCityInput {
    // "cityId" provides the identifier for the resource and
    // has to be marked as required.
    @required
    @httpLabel
    cityId: CityId
}


structure GetCityOutput {
    // "required" is used on output to indicate if the service
    // will always provide a value for the member.
    @required
    name: String,

    @required
    coordinates: CityCoordinates,
}

structure CityCoordinates {
    @required
    latitude: Float,

    @required
    longitude: Float,
}

// "error" is a trait that is used to specialize
// a structure as an error.
@error("client")
structure NoSuchResource {
    @required
    resourceType: String
}