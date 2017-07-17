#!/usr/bin/env bash

this_file="$(readlink --canonicalize-missing "${BASH_SOURCE[0]}")"
this_file_name="$(basename "${this_file}")"
test_dir="${this_file_name}.test"

test_tart()
{
	# 创建测试目录。
	mkdir --parents "${test_dir}"
	# 进入测试目录
	cd "${test_dir}"

	test_file="test"
	test_file_compressed="test.tar.gz"

	eval_toggle=true # 控制cmd执行

	# 创建压缩文件。
	printf "123" > "${test_file}"
	tar --create --gzip --file "${test_file_compressed}" "${test_file}" --verbose 
	
	# 创建回收站目录。
	trash_dir="$HOME/.local/share/Trash/files/$(date --rfc-3339=seconds)"
	cmd="mkdir --parents \"${trash_dir}\""
	$eval_toggle && eval "${cmd}"

	# 删除原文件。
	cmd="mv --target-directory=\"${trash_dir}\" \"${test_file}\""
	$eval_toggle && eval "${cmd}"

	# 解压文件。
	tar --extract --file "${test_file_compressed}" --verbose

	# 断言
	assertTrue "[ -e \"${test_file}\" ]"

	
	# 删除测试目录到回收站。
	cmd="cd .. && mv --target-directory=\"${trash_dir}\" \"${test_dir}\""
	$eval_toggle && eval "${cmd}"
}

# load shunit2
. shunit2
