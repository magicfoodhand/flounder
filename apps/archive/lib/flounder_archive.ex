use Amnesia

defdatabase FlounderArchive do
  @moduledoc """
  Documentation for FlounderArchive.
  """

  deftable FlounderRun, [{ :id, autoincrement }, :type, :meta_data, :created], type: :ordered_set, index: [:created] do
    @type t :: %FlounderRun{id: non_neg_integer, type: String.t, meta_data: any, created:  DateTime.t}

  end

  deftable FlounderResult, [{ :id, autoincrement }, :run_id, :contents, :created], type: :bag, index: [:run_id] do
    @type t :: %FlounderResult{id: non_neg_integer, run_id: non_neg_integer, contents: any, created: DateTime.t}

  end

  deftable FlounderError, [{ :id, autoincrement }, :run_id, :contents, :created], type: :bag, index: [:run_id] do
    @type t :: %FlounderError{id: non_neg_integer, run_id: non_neg_integer, contents: any, created: DateTime.t}

  end
end
