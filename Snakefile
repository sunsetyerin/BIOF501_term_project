#!/usr/bin python3
# coding=utf-8

include: "snakefiles/methylation.snake"

configfile: "configs/sample_config.yaml"

rule general:
    """
    Set of jobs to be run on any cpu resources.
    """
    input:
        expand(os.path.join(
            "m6a_test",
            "{sample}",
            "diffmode",
            "diffmod.table"),
            sample=list(config["samples"].keys())),
