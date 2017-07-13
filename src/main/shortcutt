#!/usr/bin/env bash
env_dir="$HOME/.p"

function path(){
	if [ "${#}" == "0" ]; then # 如果参数数量是0，则添加当前目录名和目录路径
		file_name="$(basename "$(pwd)")"
		file_path="$(pwd)"
		save_path="${env_dir}/${file_name}"
		cat<<EOF>"${save_path}"
#!/usr/bin/env bash
echo "${file_path}"
cd "${file_path}"
EOF
		printf "abbreviation=%s\tpath=%s\n" "${file_name}" "${file_path}"
		chmod +x "${save_path}"; ls -l "${save_path}"
	elif [ "${#}" == "1" ]; then
		if [ "${1}" == "init" ]; then # 初始化，新建环境目录
			mkdir -p "${env_dir}";
			path ".p" "${env_dir}"
			ls -l "${env_dir}"
		elif [ "${1}" == "r" ]; then
			ls -l -a "${env_dir}"
		fi
	elif [ "${#}" == "2" ]; then # 如果参数数量是2，则添加指定路径
		file_name="$1"
		file_path="$2"
		save_path="${env_dir}/${file_name}"
		cat<<EOF>"${save_path}"
#!/usr/bin/env bash
echo "${file_path}"
cd "${file_path}"
EOF
		printf "abbreviation=%s\tpath=%s\n" "${file_name}" "${file_path}"
		chmod +x "${save_path}"; ls -l "${save_path}"
	else
	    echo "arguments error"
	fi
}

path ${*};

: <<'Block_Comments'
如何bash shell使用双引号在命令替换形式中$()？
https://www.google.com/search?q=Command+Substitution+bash+double+quotes&ie=utf-8&oe=utf-8 https://unix.stackexchange.com/questions/118433/quoting-within-command-substitution-in-bash
DIRNAME="$(dirname "$FILE")" is the recommended way.
Block_Comments
