defmodule Yada.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :action, :string
      add :status, :string
      add :closed, :datetime
      add :assigned_to_id, references(:users)
      add :submitted_by_id, references(:users)
      add :updated_by_id, references(:users)

      timestamps
    end
    create index(:tasks, [:assigned_to_id])
    create index(:tasks, [:submitted_by_id])
    create index(:tasks, [:updated_by_id])

  end
end
