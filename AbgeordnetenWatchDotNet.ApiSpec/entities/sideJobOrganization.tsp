import "./entity.tsp";
import "./city.tsp";
import "./country.tsp";
import "./topic.tsp";
import "../framework/reference.tsp";

namespace AbgeordnetenWatch;

model SidejobOrganization extends Entity {
	@encodedName("application/json", "field_city")
	fieldCity: SubReference<City>;

	@encodedName("application/json", "field_country")
	fieldCountry: SubReference<Country>;

	@encodedName("application/json", "field_topics")
	fieldTopics: Reference<Topic>[];
}
