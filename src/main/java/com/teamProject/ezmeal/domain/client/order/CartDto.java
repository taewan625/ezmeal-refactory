package com.teamProject.ezmeal.domain.client.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
    private Long cart_seq;
    private Long mbr_id;
}
