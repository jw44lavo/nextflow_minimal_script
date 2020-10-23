process append_test_file{
  publishDir "$baseDir/results", mode: "symlink"
  
  input:
    file test_file

  output:
    path "${test_file.baseName}_new.txt", type: "file"

  script:
    """
    echo "Hello Jo" > ${test_file.baseName}_new.txt
    """
}


process concat_test_files {
  publishDir "$baseDir/results", mode: "symlink"

  input:
    file test_files

  output:
   path "concat_test_file.txt", type: "file"

  script:
    """
    cat ${test_files} > concat_test_file.txt
    """
}
