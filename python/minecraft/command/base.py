from dataclasses import dataclass


@dataclass
class Command:
    value: str

    def __str__(self) -> str:
        return self.value
