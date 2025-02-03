import "../entities/entity.tsp";
import "./response.tsp";

namespace AbgeordnetenWatch;

interface EntityEndpoint<TEntity extends Entity> {
  all<TOptions = {}>(...TOptions): ListResponse<TEntity>;

  get<TOptions = {}>(id: integer, ...TOptions): EntityResponse<TEntity>;
}
