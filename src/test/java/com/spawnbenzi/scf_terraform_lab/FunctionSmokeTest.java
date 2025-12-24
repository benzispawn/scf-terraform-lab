package com.spawnbenzi.scf_terraform_lab;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.function.Function;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.cloud.function.context.FunctionCatalog;

@SpringBootTest(webEnvironment = WebEnvironment.NONE)
class FunctionSmokeTest {

  @Autowired
  FunctionCatalog catalog;

  @Test
  void uppercase_function_should_work() {
    @SuppressWarnings("unchecked")
    Function<String, String> fn = (Function<String, String>) catalog.lookup("uppercase");
    assertThat(fn).isNotNull();
    assertThat(fn.apply("  hello ")).isEqualTo("HELLO");
  }
}
