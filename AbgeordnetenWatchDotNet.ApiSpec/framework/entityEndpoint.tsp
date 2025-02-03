import "../entities/entity.tsp";
import "./response.tsp";

namespace AbgeordnetenWatch;

interface EntityEndpoint<TEntity extends Entity> {
  all<TOptions = {}>(...TOptions): ListResponse<TEntity> | ErrorResponse;

  get<TOptions = {}>(id: integer, ...TOptions): EntityResponse<TEntity> | ErrorResponse;
}
