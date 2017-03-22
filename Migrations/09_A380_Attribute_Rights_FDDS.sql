-- Role Data Admin – Attributes rights - FDDS

DECLARE @M_ATTRIBUTE_id int
DECLARE @CN_ATTRIBUTE_id int
DECLARE @C_ATTRIBUTE_id int
DECLARE @ART_ATTRIBUTE_id int
DECLARE @MODMP_ATTRIBUTE_id int
DECLARE @FDDSCR_id int
DECLARE @CONTEXT_id INT

SELECT @CONTEXT_id = CONTEXT_id FROM T_EDIP_CONTEXT WHERE ContextName='A380_Admin_data'
SELECT @M_ATTRIBUTE_id = ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel = 'Maturity Level' AND AttributeName = 'FDDSMaturityLevel'
SELECT @CN_ATTRIBUTE_id = ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel = 'CN' AND AttributeName = 'FDDSCN'
SELECT @C_ATTRIBUTE_id = ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel = 'Is this a cancelled drawing ?' AND AttributeName = 'FDDSCancelled'
SELECT @MODMP_ATTRIBUTE_id = ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel = 'Applicability' AND AttributeName = 'FDDSMODMP'
SELECT @FDDSCR_id = ATTRIBUTE_id FROM T_EDIP_ATTRIBUTE WHERE AttributeLabel = 'CR' AND AttributeName = 'FDDSCR'


IF NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@M_ATTRIBUTE_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id)
BEGIN
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) 
VALUES
(@M_ATTRIBUTE_id, @CONTEXT_id, 1, 1)
END
ELSE
BEGIN
UPDATE T_EDIP_LINK_ATTRIBUTE__CONTEXT SET AttributeContextReadMode =1, AttributeContextWriteMode=1 WHERE
ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@M_ATTRIBUTE_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id
END



IF NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@CN_ATTRIBUTE_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id)
BEGIN
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) 
VALUES
(@CN_ATTRIBUTE_id, @CONTEXT_id, 1, 1)
END
ELSE
BEGIN
UPDATE T_EDIP_LINK_ATTRIBUTE__CONTEXT SET AttributeContextReadMode =1, AttributeContextWriteMode=1 WHERE
ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@CN_ATTRIBUTE_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id
END




IF NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@C_ATTRIBUTE_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id)
BEGIN
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) 
VALUES
(@C_ATTRIBUTE_id, @CONTEXT_id, 1, 1)
END
ELSE
BEGIN
UPDATE T_EDIP_LINK_ATTRIBUTE__CONTEXT SET AttributeContextReadMode =1, AttributeContextWriteMode=1 WHERE
ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@C_ATTRIBUTE_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id
END




IF NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@MODMP_ATTRIBUTE_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id)
BEGIN
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) 
VALUES
(@MODMP_ATTRIBUTE_id, @CONTEXT_id, 1, 1)
END
ELSE
BEGIN
UPDATE T_EDIP_LINK_ATTRIBUTE__CONTEXT SET AttributeContextReadMode =1, AttributeContextWriteMode=1 WHERE
ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@MODMP_ATTRIBUTE_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id
END




IF NOT EXISTS(SELECT * FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@FDDSCR_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id)
BEGIN
INSERT INTO T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, ATTRIBUTE__CONTEXT_CONTEXT_idr, AttributeContextReadMode, AttributeContextWriteMode) 
VALUES
(@FDDSCR_id, @CONTEXT_id, 1, 1)
END
ELSE
BEGIN
UPDATE T_EDIP_LINK_ATTRIBUTE__CONTEXT SET AttributeContextReadMode =1, AttributeContextWriteMode=1 WHERE
ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@FDDSCR_id AND ATTRIBUTE__CONTEXT_CONTEXT_idr=@CONTEXT_id
END

