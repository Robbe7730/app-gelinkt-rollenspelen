defmodule Dispatcher do
  use Matcher
  define_accept_types [
    html: [ "text/html", "application/xhtml+html" ],
    json: [ "application/json", "application/vnd.api+json" ]
  ]

  @any %{}
  @json %{ accept: %{ json: true } }
  @html %{ accept: %{ html: true } }

  # In order to forward the 'themes' resource to the
  # resource service, use the following forward rule:
  #
  # match "/themes/*path", @json do
  #   Proxy.forward conn, path, "http://resource/themes/"
  # end
  #
  # Run `docker-compose restart dispatcher` after updating
  # this file.

  match "/sentences/*path", @json do
    Proxy.forward conn, path, "http://resource/sentences/"
  end

  match "/texts/*path", @json do
    Proxy.forward conn, path, "http://resource/texts/"
  end

  match "/constituency-nodes/*path", @json do
    Proxy.forward conn, path, "http://resource/constituency-nodes/"
  end

  match "/characters/*path", @json do
    Proxy.forward conn, path, "http://resource/characters/"
  end

  match "/campaigns/*path", @json do
    Proxy.forward conn, path, "http://resource/campaigns/"
  end

  match "/*_", %{ last_call: true } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end
end
