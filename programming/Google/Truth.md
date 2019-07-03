

assertThat(
    assertThrows(IllegalArgumentException.class,
        () -> list.remove(0)))
    .hasMessageThat().contains("Out of bounds");
