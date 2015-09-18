defmodule Yada.TaskTest do
  use Yada.ModelCase

  alias Yada.Task

  @valid_attrs %{action: "some content", closed: "2010-04-17 14:00:00", created: "2010-04-17 14:00:00", last_updated: "2010-04-17 14:00:00", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Task.changeset(%Task{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Task.changeset(%Task{}, @invalid_attrs)
    refute changeset.valid?
  end
end
