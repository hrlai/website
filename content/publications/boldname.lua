local highlight_author_filter = {
  Para = function(el)
    if el.t == "Para" then
    for k,_ in ipairs(el.content) do
      if el.content[k].t == "Str" and el.content[k].text == "Lai,"
      and el.content[k+1].t == "Space"
      and el.content[k+2].t == "Str" and el.content[k+2].text:find("^H. R.") then
          local _,e = el.content[k+2].text:find("^H. R.")
          local rest = el.content[k+2].text:sub(e+1) 
          el.content[k] = pandoc.Strong { pandoc.Str("Lai, H. R.") }
          el.content[k+1] = pandoc.Str(rest)
          table.remove(el.content, k+2) 
      end
    end
  end
  return el
  end
}

function Div (div)
  if 'refs' == div.identifier then
    return pandoc.walk_block(div, highlight_author_filter)
  end
  return nil
end