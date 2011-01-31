curl -s -o tempfile --user rdprabhu13:13thwarrior  --data-urlencode url="slashdot.org" https://api.del.icio.us/v1/posts/add
if ! grep done tempfile;then exit 1;fi
curl -s -o tempfile --user rdprabhu13:13thwarrior  --data-urlencode url="http://www.haskell.org/all_about_monads/html/" --data-urlencode description="monads haskell" --data-urlencode shared=no https://api.del.icio.us/v1/posts/add
if ! grep done tempfile;then exit 1;fi
exit 0
