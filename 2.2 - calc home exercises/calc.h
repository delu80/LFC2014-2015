/** calculator calc.y
 * origin source by Tom Niemann at epaperpress.com/lexandyacc
 * revision Lorenzo Massimo Gramola (2014)
 */
typedef enum { typeCon, typeId, typeOpr } nodeEnum; /* used in the struct nodeType
                                                     to define the type of node*/

/* constants */
typedef struct {
    int value;                  /* value of constant */
} conNodeType;

/* identifiers */
typedef struct {
    int i;                      /* subscript to sym array */
} idNodeType;

/* operators */
typedef struct {
    int oper;                   /* operator */
    int nops;                   /* number of operands */
    struct nodeTypeTag **op;	/* operands */
} oprNodeType;

typedef struct nodeTypeTag {    /**
                                 definition for the node types, here we define a
                                 structure that holds a node for our tree.
                                    NOTE: a structure is an object which is
                                 formed by different memenbers that may have
                                 a name and diffrent types.
                                 
                                 */
    nodeEnum type;              /* type of node */
    
    union {                     /**
                                 NOTE: a union is an object that holds,
                                 according to the moments, on among the different
                                 memebrs belonging to the declared types.
                                 */
        conNodeType con;        /* constants */
        idNodeType id;          /* identifiers */
        oprNodeType opr;        /* operators */
    };
} nodeType;

/* prototypes */
nodeType *opr(int oper, int nops, ...);
nodeType *id(int i);
nodeType *con(int value);
void freeNode(nodeType *p);

extern int sym[26];
