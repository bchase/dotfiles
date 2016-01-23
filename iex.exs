# defmodule IExLast do
#   defdelegate il(txt), to: __MODULE__, as: :write
#
#   def write(txt) do
#     File.write ".iexlast", txt
#   end
# end
# import IExLast, only: [il: 2]
