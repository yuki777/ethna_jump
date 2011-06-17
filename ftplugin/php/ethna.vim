
" ethna_jump
" x.昔の開発環境依存しまくり。。。
" x.admin|userとかethnaデフォルトじゃない。。。
" 次なにか作るときのために置いておく。
"

" カーソルの下にある単語がuser or adminで始まるならactionを探して新規タブウィンドウで開く
" カーソルの下にある単語がuser or adminで始まらないなら現在開いているファイルのactionを探して新規タブウィンドウで開く
nmap ;a :call SearchAction()<CR>
if !exists("*SearchAction")
	function! SearchAction()
		" カーソルの下にある単語
		let l:cword = expand("<cword>")
		
		" 
		" admin_で始まるならそのactionを探す
		" 
		let l:match_admin = match(l:cword, "admin_")
		if l:match_admin == 0
			" 検索対象ファイル
			let l:search_file = getcwd() . "/app/action/". substitute(l:cword, "_", "/", "g") . ".php"
			" 既に開いているファイルか確認したい
			" 全タブウィンドウの・・・
			for i in range(tabpagenr('$'))
				" タブウィンドウの中のウィンドウの・・・
				for item in tabpagebuflist(i + 1)
					" 開いているファイル名 == 開きたいファイル名なら
					" ==? で大文字小文字無視
					if fnamemodify(expand(bufname(item)), ":p") ==? l:search_file
						" そのタブウィンドウへ移動
						execute "tabnext " (i + 1)
						return
					endif
				endfor
			endfor
			" ethna的に良い感じの大文字に変換
			let l:search_file = UpperFilename(l:search_file, "action")
			" 開けたらreturn
			if OpenFile(l:search_file) == 1
				return
			endif
		endif
		
		" 
		" user_で始まるならそのactionを探す
		" 
		let l:match_user = match(l:cword, "user_")
		if l:match_user == 0
			" 検索対象ファイル
			let l:search_file = getcwd() . "/app/action/". substitute(l:cword, "_", "/", "g") . ".php"
			" 既に開いているファイルか確認したい
			" 全タブウィンドウの・・・
			for i in range(tabpagenr('$'))
				" タブウィンドウの中のウィンドウの・・・
				for item in tabpagebuflist(i + 1)
					" 開いているファイル名 == 開きたいファイル名なら
					" ==? で大文字小文字無視
					if fnamemodify(expand(bufname(item)), ":p") ==? l:search_file
						" そのタブウィンドウへ移動
						execute "tabnext " (i + 1)
						return
					endif
				endfor
			endfor
			" ethna的に良い感じの大文字に変換
			let l:search_file = UpperFilename(l:search_file, "action")
			" 開けたらreturn
			if OpenFile(l:search_file) == 1
				return
			endif
		endif
		
		" 
		" admin_でもuser_でもないなら現在開いているファイルのactionを探す
		" 
		call GoAction()
	endfunction
endif

" カーソルの下にある単語がuser or adminで始まるならviewを探して新規タブウィンドウで開く
" カーソルの下にある単語がuser or adminで始まらないなら現在開いているファイルのviewを探して新規タブウィンドウで開く
nmap ;v :call SearchView()<CR>
if !exists("*SearchView")
	function! SearchView()
		" カーソルの下にある単語
		let l:cword = expand("<cword>")
		
		" 
		" admin_で始まるならそのviewを探す
		" 
		let l:match_admin = match(l:cword, "admin_")
		if l:match_admin == 0
			" 検索対象ファイル
			let l:search_file = getcwd() . "/app/view/". substitute(l:cword, "_", "/", "g") . ".php"
			" 既に開いているファイルか確認したい
			" 全タブウィンドウの・・・
			for i in range(tabpagenr('$'))
				" タブウィンドウの中のウィンドウの・・・
				for item in tabpagebuflist(i + 1)
					" 開いているファイル名 == 開きたいファイル名なら
					" ==? で大文字小文字無視
					if fnamemodify(expand(bufname(item)), ":p") ==? l:search_file
						" そのタブウィンドウへ移動
						execute "tabnext " (i + 1)
						return
					endif
				endfor
			endfor
			" ethna的に良い感じの大文字に変換
			let l:search_file = UpperFilename(l:search_file, "view")
			" 開けたらreturn
			if OpenFile(l:search_file) == 1
				return
			endif
		endif
		
		" 
		" user_で始まるならそのviewを探す
		" 
		let l:match_user = match(l:cword, "user_")
		if l:match_user == 0
			" 検索対象ファイル
			let l:search_file = getcwd() . "/app/view/". substitute(l:cword, "_", "/", "g") . ".php"
			" 既に開いているファイルか確認したい
			" 全タブウィンドウの・・・
			for i in range(tabpagenr('$'))
				" タブウィンドウの中のウィンドウの・・・
				for item in tabpagebuflist(i + 1)
					" 開いているファイル名 == 開きたいファイル名なら
					" ==? で大文字小文字無視
					if fnamemodify(expand(bufname(item)), ":p") ==? l:search_file
						" そのタブウィンドウへ移動
						execute "tabnext " (i + 1)
						return
					endif
				endfor
			endfor
			" ethna的に良い感じの大文字に変換
			let l:search_file = UpperFilename(l:search_file, "view")
			" 開けたらreturn
			if OpenFile(l:search_file) == 1
				return
			endif
		endif
		
		" 
		" admin_でもuser_でもないなら現在開いているファイルのviewを探す
		" 
		call GoView()
	endfunction
endif

" カーソルの下にある単語がuser or adminで始まるならtemplateを探して新規タブウィンドウで開く
" カーソルの下にある単語がuser or adminで始まらないなら現在開いているファイルのtemplateを探して新規タブウィンドウで開く
nmap ;t :call SearchTemplate()<CR>
if !exists("*SearchTemplate")
	function! SearchTemplate()
		" カーソルの下にある単語
		let l:cword = expand("<cword>")
		
		" 
		" admin_で始まるならそのtemplateを探す
		" 
		let l:match_admin = match(l:cword, "admin_")
		if l:match_admin == 0
			" 検索対象ファイル
			let l:search_file = getcwd() . "/template/default/". substitute(l:cword, "_", "/", "g") . ".tpl"
			" 既に開いているファイルか確認したい
			" 全タブウィンドウの・・・
			for i in range(tabpagenr('$'))
				" タブウィンドウの中のウィンドウの・・・
				for item in tabpagebuflist(i + 1)
					" 開いているファイル名 == 開きたいファイル名なら
					" ==? で大文字小文字無視
					if fnamemodify(expand(bufname(item)), ":p") ==? l:search_file
						" そのタブウィンドウへ移動
						execute "tabnext " (i + 1)
						return
					endif
				endfor
			endfor
			" ethna的に良い感じの大文字に変換
			let l:search_file = UpperFilename(l:search_file, "template")
			" 開けたらreturn
			if OpenFile(l:search_file) == 1
				return
			endif
		endif
		
		" 
		" user_で始まるならそのtemplateを探す
		" 
		let l:match_user = match(l:cword, "user_")
		if l:match_user == 0
			" 検索対象ファイル
			let l:search_file = getcwd() . "/template/default/". substitute(l:cword, "_", "/", "g") . ".tpl"
			" 既に開いているファイルか確認したい
			" 全タブウィンドウの・・・
			for i in range(tabpagenr('$'))
				" タブウィンドウの中のウィンドウの・・・
				for item in tabpagebuflist(i + 1)
					" 開いているファイル名 == 開きたいファイル名なら
					" ==? で大文字小文字無視
					if fnamemodify(expand(bufname(item)), ":p") ==? l:search_file
						" そのタブウィンドウへ移動
						execute "tabnext " (i + 1)
						return
					endif
				endfor
			endfor
			" ethna的に良い感じの大文字に変換
			let l:search_file = UpperFilename(l:search_file, "template")
			" 開けたらreturn
			if OpenFile(l:search_file) == 1
				return
			endif
		endif
		
		" 
		" admin_でもuser_でもないなら現在開いているファイルのtemplateを探す
		" 
		call GoTemplate()
	endfunction
endif

" 
" 現在開いているファイルのactionを新規タブウィンドウで開く
" 
if !exists("*GoAction")
	function! GoAction()
		" 現在開いているファイルのフルパス
		let l:current_file = expand("%:p")
		" 現在開いているファイルがaction
		if '/action/' == matchstr(l:current_file, '/action/')
			echo "You Already Opened Action File. すでにActionファイルを開いています。"
			return
		" 現在開いているファイルがview
		elseif '/view/' == matchstr(l:current_file, '/view/')
			let l:search_file = substitute(l:current_file, "/view/", "/action/", "g")
		" 現在開いているファイルがtemplate
		elseif '/template/' == matchstr(l:current_file, '/template/')
			" 
			" 小文字から大文字へ admin/account/list.php -> Admin/Account/List.php
			" 
			"echo l:current_file " /home/htdocs/DOMAIN/APPNAME/template/default/admin/account/list.tpl
			let l:current_directory = getcwd() " /home/htdocs/DOMAIN/APPNAME
			let l:relative_path = substitute(l:current_file, l:current_directory + "/", "", "g")
			let l:relative_path_cut = substitute(l:relative_path, l:current_directory . "/template/default", "", "g")
			" /の後の1文字目を大文字にする
			let l:relative_path_upper = substitute(l:relative_path_cut, '\/\([a-z]\)', '\/\u\1', "g")
			let l:search_file = getcwd() . "/app/action" . l:relative_path_upper
			let l:search_file = substitute(l:search_file, ".tpl", ".php", "g")
		endif
		" ファイルは読み込み可能か
		if ! filereadable(l:search_file)
			echo l:search_file . " ファイルが無いか、読み込めません。"
			return
		endif
		
		" 
		" 既に開いているファイルか確認したい. 全タブウィンドウの・・・
		" 
		for i in range(tabpagenr('$'))
			" タブウィンドウの中のウィンドウの・・・
			for item in tabpagebuflist(i + 1)
				" 開いているファイル名 == 開きたいファイル名なら
				if fnamemodify(expand(bufname(item)), ":p") == l:search_file
					" そのタブウィンドウへ移動
					execute "tabnext " (i + 1)
					return
				endif
			endfor
		endfor
		
		" タブの最後に移動
		execute ":tablast "
		" タブを新規作成してactionファイルを開く
		"execute ":tabnew " . l:search_file
		execute ":tabnew +NERDTree " . l:search_file
		execute 2 . "wincmd w"
	endfunction
endif

" 
" 現在開いているファイルのviewを新規タブウィンドウで開く
" 
if !exists("*GoView")
	function! GoView()
		" 現在開いているファイルのフルパス
		let l:current_file = expand("%:p")
		" 現在開いているファイルがaction
		if '/action/' == matchstr(l:current_file, '/action/')
			let l:search_file = substitute(l:current_file, "/action/", "/view/", "g")
		" 現在開いているファイルがview
		elseif '/view/' == matchstr(l:current_file, '/view/')
			echo "You Already Opened View File. すでにViewファイルを開いています。"
			return
		" 現在開いているファイルがtemplate
		elseif '/template/' == matchstr(l:current_file, '/template/')
			" 
			" 小文字から大文字へ admin/account/list.php -> Admin/Account/List.php
			" 
			"echo l:current_file " /home/htdocs/DOMAIN/APPNAME/template/default/admin/account/list.tpl
			let l:current_directory = getcwd() " /home/htdocs/DOMAIN/APPNAME
			let l:relative_path = substitute(l:current_file, l:current_directory + "/", "", "g")
			let l:relative_path_cut = substitute(l:relative_path, l:current_directory . "/template/default", "", "g")
			" /の後の1文字目を大文字にする
			let l:relative_path_upper = substitute(l:relative_path_cut, '\/\([a-z]\)', '\/\u\1', "g")
			let l:search_file = getcwd() . "/app/view" . l:relative_path_upper
			let l:search_file = substitute(l:search_file, ".tpl", ".php", "g")
		endif
		" ファイルは読み込み可能か
		if ! filereadable(l:search_file)
			echo l:search_file . " ファイルが無いか、読み込めません。"
			return
		endif
		
		" 
		" 既に開いているファイルか確認したい. 全タブウィンドウの・・・
		" 
		for i in range(tabpagenr('$'))
			" タブウィンドウの中のウィンドウの・・・
			for item in tabpagebuflist(i + 1)
				" 開いているファイル名 == 開きたいファイル名なら
				if fnamemodify(expand(bufname(item)), ":p") == l:search_file
					" そのタブウィンドウへ移動
					execute "tabnext " (i + 1)
					return
				endif
			endfor
		endfor
		
		" タブの最後に移動
		execute ":tablast "
		" タブを新規作成してviewファイルを開く
		"execute ":tabnew " . l:search_file
		execute ":tabnew +NERDTree " . l:search_file
		execute 2 . "wincmd w"
	endfunction
endif


" 
" 現在開いているファイルのtemplateを新規タブウィンドウで開く
" 
if !exists("*GoTemplate")
	function! GoTemplate()
		" 現在開いているファイルのフルパス
		let l:current_file = expand("%:p")
		" 現在開いているファイルがaction
		if '/action/' == matchstr(l:current_file, '/action/')
			let l:search_file = substitute(l:current_file, "/app/action/", "/template/default/", "g")
			let l:search_file = substitute(l:search_file , ".php",         ".tpl",               "g")
			let l:search_file = tolower(l:search_file)
		" 現在開いているファイルがview
		elseif '/view/' == matchstr(l:current_file, '/view/')
			let l:search_file = substitute(l:current_file, "/app/view/", "/template/default/", "g")
			let l:search_file = substitute(l:search_file , ".php",       ".tpl",               "g")
			let l:search_file = tolower(l:search_file)
		" 現在開いているファイルがtemplate
		elseif '/template/' == matchstr(l:current_file, '/template/')
			echo "You Already Opened Template File. すでにTemplateファイルを開いています。"
			return
		endif
		" ファイルは読み込み可能か
		if ! filereadable(l:search_file)
			echo l:search_file . " ファイルが無いか、読み込めません。"
			return
		endif
		
		" 
		" 既に開いているファイルか確認したい. 全タブウィンドウの・・・
		" 
		for i in range(tabpagenr('$'))
			" タブウィンドウの中のウィンドウの・・・
			for item in tabpagebuflist(i + 1)
				" 開いているファイル名 == 開きたいファイル名なら
				if fnamemodify(expand(bufname(item)), ":p") == l:search_file
					" そのタブウィンドウへ移動
					execute "tabnext " (i + 1)
					return
				endif
			endfor
		endfor
		
		" タブの最後に移動
		execute ":tablast "
		" タブを新規作成してviewファイルを開く
		"execute ":tabnew " . l:search_file
		execute ":tabnew +NERDTree " . l:search_file
		execute 2 . "wincmd w"
	endfunction
endif

" 
" ファイル名をethna的に良い感じの大文字にして返す
" 
if !exists("*UpperFilename")
	function! UpperFilename(filename, to)
		" ファイルのフルパス
		let l:filename = a:filename
		" どこへ行きたいか？ action|view|template
		let l:to = a:to
		" actionへ行きたい
		if l:to == 'action'
			" 
			" 小文字から大文字へ admin/account/list.php -> Admin/Account/List.php
			" 
			"echo l:filename " /home/htdocs/DOMAIN/APPNAME/template/default/admin/account/list.tpl
			let l:current_directory = getcwd() " /home/htdocs/DOMAIN/APPNAME
			let l:relative_path = substitute(l:filename, l:current_directory + "/", "", "g") " app/action/admin/account/list.php
			let l:relative_path_cut = substitute(l:relative_path, l:current_directory . "/app/action", "", "g") " /admin/account/list.php
			" /の後の1文字目を大文字にする
			let l:search_file = substitute(l:relative_path_cut, '\/\([a-z]\)', '\/\u\1', "g")
			let l:search_file = l:current_directory . "/app/action" .l:search_file
			return l:search_file
		" viewへ行きたい
		elseif l:to == 'view'
			let l:current_directory = getcwd() " /home/htdocs/DOMAIN/APPNAME
			let l:relative_path = substitute(l:filename, l:current_directory + "/", "", "g") " app/action/admin/account/list.php
			let l:relative_path_cut = substitute(l:relative_path, l:current_directory . "/app/view", "", "g") " /admin/account/list.php
			let l:search_file = substitute(l:relative_path_cut, '\/\([a-z]\)', '\/\u\1', "g")
			let l:search_file = l:current_directory . "/app/view" .l:search_file
			return l:search_file
		" templateへ行きたい
		elseif l:to == 'template'
			let l:current_directory = getcwd() " /home/htdocs/DOMAIN/APPNAME
			let l:relative_path = substitute(l:filename, l:current_directory + "/", "", "g") " app/action/admin/account/list.php
			let l:relative_path_cut = substitute(l:relative_path, l:current_directory . "/template/default", "", "g") " /admin/account/list.php
			let l:search_file = substitute(l:relative_path_cut, '\/\([a-z]\)', '\/\u\1', "g")
			let l:search_file = l:current_directory . "/template/default" .l:search_file
			return l:search_file
		endif
	endfunction
endif

" 
" ファイルを開く
" 
if !exists("*OpenFile")
	function! OpenFile(search_file)
		let l:open_filename = a:search_file
		" ファイルは読み込み可能か
		if filereadable(l:open_filename)
			" タブの最後に移動
			execute ":tablast "
			" タブを新規作成してファイルを開く
			execute ":tabnew +NERDTree " . l:open_filename
			execute 2 . "wincmd w"
			return 1
		endif
	endfunction
endif
