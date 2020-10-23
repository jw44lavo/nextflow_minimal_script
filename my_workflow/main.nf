nextflow.preview.dsl=2

include {
  append_test_file;
  concat_test_files
} from "$baseDir/modules/test.nf"


workflow {
log.info ""
log.info """\
Welcome to this test script, Jo!
date:             ${params.date}

"""
log.info ""

  main:
    data = Channel.fromPath(
      params.data
    )

    append_test_file(
      data
    )

    concat_test_files(
      append_test_file.out.collect()
    )
}
