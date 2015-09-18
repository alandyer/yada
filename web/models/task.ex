defmodule Yada.Task do
  use Yada.Web, :model

  schema "tasks" do
    field :action, :string
    field :status, :string
    field :closed, Ecto.DateTime
    belongs_to :assigned_to, Yada.User
    belongs_to :submitted_by, Yada.User
    belongs_to :updated_by, Yada.User

    timestamps
  end

  @required_fields ~w(action status)
  @optional_fields ~w(closed)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
