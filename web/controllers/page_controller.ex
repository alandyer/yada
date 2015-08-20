defmodule Yada.PageController do
  use Yada.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
